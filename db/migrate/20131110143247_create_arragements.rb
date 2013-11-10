class CreateArragements < ActiveRecord::Migration
  def change
    create_table :arragements do |t|
    	t.integer :user_id
    	t.integer :lesson_id
    end

    add_index :arragements, :user_id
    add_index :arragements, :lesson_id
  end
end
