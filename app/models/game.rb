class Game < ActiveRecord::Base

  belongs_to :gametype
  has_many :users
  has_many :game_cards

  has_many :cards, through: :game_cards

  def dealer_plays
    users_except_dealer = users.where.not(dealer: true)
    dealer = User.dealer(users)[0]
    if users_except_dealer.where(stay: false).count == 0
      while dealer.total_value < 17
        dealer.draw_card(1)
      end
      dealer.update_columns(stay: true)
    end
  end

  def game_end?
    users.where(stay: false).count == 0
  end

  def winner
    #We can start keeping score from here if we want
    if self.game_end?
      not_busted_users = users.where(busted: false)
      max = not_busted_users.maximum(total_value)
      winners = not_busted_users.where(total_value: max)

      if (winners.count == 1)
        self.update_columns(winner: winners.first.user_name)
        return true
      else
        #This is a push
        return false
      end
      
    end
  end

  def restart
    self.users.each do |user|
      UserCard.where(user_id: user.id).destroy_all
      user.update_columns(total_value: 0, stay: false )
    end
    self.update_columns(winner: nil)
    Card.reset
  end

end
