class User < ActiveRecord::Base
  has_secure_password
  
  belongs_to :game
  has_many :user_cards
  has_many :cards, through: :user_cards

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  def draw_card(n)
    n.times do 
      card = Card.draw
      self.update(card_id: card.id)
    end
  end

end
