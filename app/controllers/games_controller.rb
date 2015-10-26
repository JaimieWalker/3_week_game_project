class GamesController < ApplicationController
  before_action :require_user, only: [:index, :new, :show]
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        UserGame.create( user_id: current_user.id, game_id: @game.id )

        format.html { redirect_to @game, notice: "Game Room created!" }
        format.json { render :show, location: @game }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @game = Game.find(params[:id])

    if !current_user.games.include?(@game)
      if @game.users.length < 4
        UserGame.create( user_id: current_user.id, game_id: @game.id )
      else
        respond_to do |format|
          format.html { redirect_to games_path, notice: "Sorry! Room is full!" }
        end
      end
    end

  end

  def destroy
    @game = Game.find(params[:id])
    @game.users.each do |user|
      UserGame.where(user_id: user.id, game_id: @game.id ).destroy
    end
    @game.destroy
    redirect_to root_url
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
