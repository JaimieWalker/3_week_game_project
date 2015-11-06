class User < ActiveRecord::Base
  has_secure_password

  belongs_to :game
  #UserCard is actually a hand
  has_many :user_cards
  has_many :cards, through: :user_cards

  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true


  def draw_card(n)
    initial_value = self.total_value
    value = 0
    n.times do
      card = Card.draw(game)
      self.cards << card
      value += card.value.to_i
    end
    self.update_columns(total_value: initial_value + value)
  end

  def self.create_dealer
    User.skip_callback(:create)
    dealer = User.new(user_name: "Dealer",dealer: true)
    dealer.save(:validate => false)
    User.set_callback(:create)
    dealer
  end

  def self.dealer(in_room)
    in_room.where(dealer: true)
  end

  def busted?
    if bool = (self.total_value > 21)
      self.update_columns(bust: true)
    end
    bool
  end



end
