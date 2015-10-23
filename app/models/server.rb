require "socket"

class Server < ActiveRecord::Base

  has_many :rooms
  has_many :users, through: :rooms

 
end
