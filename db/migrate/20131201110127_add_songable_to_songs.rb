class AddSongableToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :songable_type, :string
  	add_column :songs, :songable_id, :integer
  end
end
