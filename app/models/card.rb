class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :dealer, :class_name => "User", :foreign_key => "user_id"
  has_many :users
  has_many :game_cards
  has_many :games, through: :game_cards
 
def self.create_deck
    
    @cards = Dir["*/assets/images/*.png"]
    #Create Regex to assign a value to a card. And fill the database with it if they do not have
    #what we want
    if Card.all.count < 52
      @cards.each do |card|
        value = card.split("app/assets/images/").pop.split("_of_").shift
        suit = card.split("app/assets/images/").pop.split("_of_").pop.gsub('.png', '')     
        if value == "ace"
          Card.create(name:card,value:11,suit:suit)
        elsif value == "king" || value == "queen" || value == "jack"
          Card.create(name:card,value:10,suit:suit)
        else
          Card.create(name:card,value:value.to_i,suit:suit)
        end
      end
    end
    end

def self.draw
  
   random_card = Card.all.sample
  while random_card.drawn == true
   random_card = Card.all.sample
 end
   random_card.update(drawn: true)
   return random_card
end





end
