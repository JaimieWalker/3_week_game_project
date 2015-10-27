class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :dealer, :class_name => "User", :foreign_key => "user_id"
  has_many :users
  has_many :game_cards
  has_many :games, through: :game_cards
 
end
