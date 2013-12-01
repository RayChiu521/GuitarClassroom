class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :title
    	t.string :singer
    	t.string :youtube_link
    	t.timestamps
    end
  end
end
