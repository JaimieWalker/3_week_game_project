class SessionsController < ApplicationController
  def new; end

  def create
  	  @user = User.find_by_email(params[:session][:email])
  	  if @user && @user.authenticate(params[:session][:password])
	    	session[:user_id] = @user.id
	   		redirect_to root_url
  	  else
	    	redirect_to login_path
  	  end
	end

	def destroy
      # @user_game = UserGame.find_by_user_id(current_user.id)
      current_user.update_columns(game_id: nil)
      
      
  	  session[:user_id] = nil
			redirect_to root_url
	end
end
