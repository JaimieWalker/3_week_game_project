class User < ActiveRecord::Base
  require "socket"

  belongs_to :room
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { within: 8..16 }
  
  #   def initialize(server)
#     @server = server
#     @request = nil
#     @response = nil
#     listen
#     send
#     @request.join
#     @response.join
#   end

#   def listen
#     @response = Thread.new do
#       loop{
#         msg = @server.gets.chomp
#         puts "#{msg}"
#       }
#     end
#   end

#   def send
#     puts "Enter the username:"
#     @request = Thread.new do
#      loop{
#         msg = $stdin.gets.chomp
#         @server.puts(msg)
#      }
#     end
#   end

end



# server = TCPSocket.open("localhost",3000)
# Client.new(server)
