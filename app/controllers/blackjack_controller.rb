class BlackjackController < ApplicationController
  def start

    @cards = Dir["*/assets/images/*.png"]
    #Create Regex to assign a value to a card. And fill the database with it if they do not have
    #what we want 

    if Card.all.count < 52
      @cards.each { |card| card.create() } 
    end
    # "app/assets/images/king_of_diamonds.png"
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
