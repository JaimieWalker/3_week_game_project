class GamesController < ApplicationController
  before_action :require_user, only: [:index]

  def index 
  @game = Game.new
   @game.cards_in_hand
    @game.dealer
  
  end

  def hit 
   @deal = true  
     render :index
  end




# def hit
#   cards_in_hand += new_card
#   num_check
# end

# def num_check
#    if @sum > 21 
#     game_over
# end


end
