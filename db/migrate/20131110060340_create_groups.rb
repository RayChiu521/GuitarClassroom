class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :title, null: false
    	t.boolean :is_admin, default: false
    end
  end
end
