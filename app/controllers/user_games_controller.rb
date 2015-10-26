class UserGamesController < ApplicationController

  def destroy
    @user_game = UserGame.find_by_game_id(params[:id])
    @user_game.destroy
  end
end
