class UsersController < ApplicationController

	skip_before_action :require_login, :only=>[:new,:create]

	def new
		@user = User.new
		render 'new', layout: 'single_page'
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Your account was created."
			session[:user_id] = @user.id
			redirect_to root_url
		else
			render 'new', layout: 'single_page'
		end
	end


	private

	def user_params
		params.require(:user)
					.permit(:account,
									:password,
									:password_confirmation,
									:nickname,
									:gender,
									:email,
									:cellphone)
	end
end