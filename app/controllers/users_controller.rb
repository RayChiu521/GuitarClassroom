class UsersController < ApplicationController

	skip_before_action :require_login, :only=>[:new,:create]
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.includes(:groups).all
	end

	def show; end

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
			render :new, layout: 'single_page'
		end
	end

	def edit; end

	def update
		if @user.update(user_params.except!(:account))
			flash[:notice] = "This account was updated."
			redirect_to users_path
		else
			render :edit
		end
	end


	private

		def set_user
			@user = User.find(params[:id])
		end

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