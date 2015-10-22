class Room < ActiveRecord::Base
  belongs_to :server
  has_many :users
end