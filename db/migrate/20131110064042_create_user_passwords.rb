class CreateUserPasswords < ActiveRecord::Migration
  def change
    create_table :user_passwords do |t|
    	t.integer :user_id
    	t.string :password_hash
    	t.string :password_salt
    	t.timestamps
    end

    add_index :user_passwords, :user_id
  end
end
