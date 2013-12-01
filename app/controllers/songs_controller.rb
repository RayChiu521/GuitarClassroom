class SongsController < ApplicationController

	before_action :set_song, :check_auth, only: [:show, :edit, :update, :destroy]

	def index
		if current_user.is_teacher? or current_user.is_admin?
			@songs = Song.all
		else
			@songs = current_user.songs
		end
	end

	def show

	end

	def new
		@song = Song.new
	end

	def create
		@song = current_user.songs.build(song_params)
		if @song.save
			flash[:notice] = "#{@song.title} was created."
			redirect_to songs_path
		else
			render :new
		end
	end

	def edit; end

	def update
		if @song.update(song_params)
			flash[:notice] = "#{@song.title} was updated."
			redirect_to songs_path
		else
			render :edit
		end
	end

	def destroy

	end

	private

		def set_song
			@song = Song.find(params[:id])
		end

		def song_params
			params.require(:song).permit(:title, :singer, :youtube_link, :youtube_embed)
		end

		def check_auth
			if !current_user.is_teacher? and !current_user.is_admin? and !current_user.songs.include?(@song)
				redirect_to songs_path, flash: { error: "You can't do that." } and return
			end
		end
end