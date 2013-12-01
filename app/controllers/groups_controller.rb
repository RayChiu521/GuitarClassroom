class GroupsController < ApplicationController

	before_action :set_user, :set_group, only: [:join, :quit]
	def index
		@users = User.all
	end

	def user_groups
		@groups = Group.all
		@user = User.find(params[:id])

		respond_to do |format|
			format.html
			format.js
		end
	end

	def join
		@user.join_group!(@group)

		respond_to do |format|
			format.html do
				flash[:notice] = "You have successfully joined!" unless @user.errors.any?
			end
			format.js do
				@users = User.all
				@groups = Group.all
			end
		end
	end

	def quit
		@user.quit_group!(@group)

		respond_to do |format|
			format.html do
				flash[:notice] = "You have successfully joined!" unless @user.errors.any?
			end
			format.js do
				@users = User.all
				@groups = Group.all
				render :join
			end
		end
	end

	private

		def set_user
			@user = User.find(params[:user_id])
		end

		def set_group
			@group = Group.find(params[:id])
		end
end