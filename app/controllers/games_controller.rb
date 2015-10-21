class GamesController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @user = current_user

      respond_to do |format|
        format.html
        format.json { render json: @user }
      end
  end
end
