class Game < ActiveRecord::Base
  has_many :user_games
  has_many :game_cards

  has_many :users, through: :user_games
  has_many :cards, through: :game_cards
end
