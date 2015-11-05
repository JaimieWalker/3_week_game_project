class GamesController < ApplicationController
  before_action :require_user, only: [:index, :new, :show]
  def index
    @games = Game.all
    current_user.update_columns(game_id: nil)
  end

  def new
    @game = Game.new
    Card.create_deck
  end

  def create
    @game = Game.new(game_params)
    #Creates a dealer automatically for that room
    # binding.pry



    respond_to do |format|
      if @game.save
        @game.users << User.create_dealer
        @game.users.last.update_columns(game_id: @game.id)
        # current_user.create( user_id: current_user.id, game_id: @game.id )
        current_user.update_columns(game_id: @game.id)
        format.html { redirect_to @game, notice: "Game Room created!" }
        format.json { render :show, location: @game }
      else
        format.html { render :new }
      end
    end
  end

  def restart
    @game = Game.find(params[:id])
    @game.restart
    @game.users.each do |user|
      user.update_columns(stay: false)
    end
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])

    if @game.users.length < 4
      current_user.update_columns(game_id: @game.id)
    else
      respond_to do |format|
        format.html { redirect_to games_path, notice: "Sorry! Room is full!" }
      end
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.users.each do |user|
      current_user.update_columns(game_id: nil)
    end
    @game.destroy
    redirect_to root_url
  end


  def hit

    #draw a card unless the user has stayed
    unless current_user.stay
      current_user.draw_card(1)
      @game = Game.find(params[:id])
    end
    #Needs to check for a busted hand
    redirect_to @game

  end

  def stay
    #Check if everyones stay is true. If so, then the dealer draws
    @game = Game.find(params[:id])
    current_user.update_columns(stay: true)
    @game.dealer_plays
    
    redirect_to @game
  end



  private
  def game_params
    params.require(:game).permit(:name)
  end
end
