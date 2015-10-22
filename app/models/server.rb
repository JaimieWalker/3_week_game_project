require "socket"

class Server < ActiveRecord::Base

  has_many :rooms
  has_many :users, through: :rooms

  #When the page loads, we should have the server connected to it. 

  # def initialize(ip,port)

  #   @server = TCPServer.open(ip,port)
  #   @connections = {}
  #   @rooms = {}
  #   @clients = {}
  #   @connections[:server] = @server
  #   @connections[:rooms] = @rooms
  #   @connections[:clients]= @clients
  #   run
  # end

  # def listen_user_messages(username,client)
  #   loop {
  #     msg = client.gets.chomp
  #     @connections[:clients].each do |other_name, other_client|
  #       unless other_name == username
  #         other_client.puts"#{username.to_s}: #{msg}"
  #       end
  #     end
  #   }
  # end

  # def run
  #   loop{
  #     Thread.start(@server.accept) do |client|
  #       # binding.pry
  #       nick_name = client.gets.chomp.to_sym
  #       @connections[:clients].each do |other_name, other_client|
  #         if nick_name == other_name || client == other_client
  #           client.puts "This username already exists"
  #           Thread.kill self
  #         end
  #       end
  #       puts "#{nick_name} #{client}"
  #       @connections[:clients][nick_name] = client
  #       client.puts "Connection Successful!!!"
  #       listen_user_messages(nick_name,client)
  #     end
  #   }.join
  # end
end

# Server.new("localhost", 3000) # (ip, port) in each machine "localhost" = 127.0.0.1

