

namespace :server do
  desc "Runs the server"
  task run_server: :environment do
    ruby "../Game_project/config/listen.rb"
  end

  desc "Connect the client"
  task client: :environment do
    ruby "../Game_project/app/models/client.rb"
  end

end
