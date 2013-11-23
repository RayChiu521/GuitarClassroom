class SessionsController < ApplicationController

	skip_before_action :require_login, :only=>[:new,:create]

	def new
		@user = User.new
		render 'new', layout: 'single_page'
	end

	def create
		@user = User.new(params.require(:user).permit(:account, :password))
		user = User.authenticate(@user.account, @user.password)
		if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to root_url
    else
      flash.alert = "Invalid account or password"
      redirect_to log_in_path
    end
	end

	def destroy
	end

end
