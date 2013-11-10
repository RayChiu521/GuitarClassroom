class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
    	t.datetime :lesson_date
    	t.text :content, default: ''
    	t.timestamps
    end
  end
end
