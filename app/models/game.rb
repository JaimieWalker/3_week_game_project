class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games





def cards_in_hand

return rand(1..11) + rand(1..11)
end
  
def hit(int)
return int + rand(1..11)
end


def dealer
  return rand(1..11) + rand(1..11) 
end




 








end
