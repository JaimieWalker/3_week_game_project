class Game < ActiveRecord::Base

  belongs_to :gametype
  has_many :users
  has_many :game_cards
  
  has_many :cards, through: :game_cards
  

  
end
