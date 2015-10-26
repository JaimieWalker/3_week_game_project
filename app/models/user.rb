class User < ActiveRecord::Base
  has_secure_password

  has_many :user_games
  has_many :games, through: :user_games
  has_many :game_cards, through: :games
  has_many :cards, through: :game_cards

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
