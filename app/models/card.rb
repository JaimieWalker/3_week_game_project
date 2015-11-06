class Card < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :game_cards
  has_many :games, through: :game_cards

  def self.create_deck(game)

    @cards = Dir["*/assets/images/*.png"]
    game_card = 0
    # if Card.all.count < 52
    @cards.each do |card|

      value = card.split("app/assets/images/").pop.split("_of_").shift
      suit = card.split("app/assets/images/").pop.split("_of_").pop.gsub('.png', '')
      if value == "ace"
        #This needs to be fixed, because the game is not getting the game id
       game_card = Card.create(name:card,value:11,suit:suit,face: value)
       # binding.pry
       GameCard.create(game_id: game.id, card_id: game_card.id)
        
      elsif value == "king" || value == "queen" || value == "jack"
       game_card = Card.create(name:card,value:10,suit:suit,face: value)
       GameCard.create(game_id: game.id, card_id: game_card.id)
      else
       game_card = Card.create(name:card,value:value.to_i,suit:suit,face: value)
       GameCard.create(game_id: game.id, card_id: game_card.id)
      end
    end

  end
  # end

  def self.draw(game)
    card = GameCard.where(game_id: game.id).shuffle.sample
    card = Card.find_by_id(card.card_id)
    card.update_columns(drawn: true)
    return card
  end

  def self.reset(game)
    card_ids = GameCard.where(game_id: game.id)
    Card.where(id: card_ids).update_all(drawn: false)
  end
end
