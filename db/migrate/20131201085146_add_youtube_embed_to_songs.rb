class AddYoutubeEmbedToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :youtube_embed, :text
  end
end
