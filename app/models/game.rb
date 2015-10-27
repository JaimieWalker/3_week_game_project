class Game < ActiveRecord::Base

  belongs_to :gametype
  has_many :user_games
  has_many :game_cards
  
  has_many :users, through: :user_games
  has_many :cards, through: :game_cards
  has_one :dealer, class_name: "User", foreign_key: "user_id"

  
end
