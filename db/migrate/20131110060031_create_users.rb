class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :account, null: false
    	t.string :password
    	t.string :nickname, default: ""
    	t.string :gender, default: ""
    	t.string :email, default: ""
    	t.string :cellphone, default: ""
    	t.timestamps
    end
  end
end
