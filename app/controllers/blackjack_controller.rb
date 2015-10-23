class BlackjackController < ApplicationController
  def create

    @cards = Dir["*/assets/images/*.png"]
    #Create Regex to assign a value to a card. And fill the database with it if they do not have
    #what we want

    if Card.all.count < 52
      @cards.each do |card|
        value = card.split("app/assets/images/").pop.split("_of_").shift
        if value == "ace"
          Card.create(name:card,value:11)
        elsif value == ("king" || "queen" || "jack")
          Card.create(name:card,value:10)
        else
          Card.create(name:card,value:value.to_i)
        end
      end
    end
  end


  # def index

  # @game = Game.new
  #   # binding.pry
  #  @game.cards_in_hand
  #   @game.dealer
  # end

  # def hit
  #  @deal = true
  #    render :index
  # end




  # def hit
  #   cards_in_hand += new_card
  #   num_check
  # end

  # def num_check
  #    if @sum > 21
  #     game_over
  # end

end
