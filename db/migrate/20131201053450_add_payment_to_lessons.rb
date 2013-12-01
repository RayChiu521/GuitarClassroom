class AddPaymentToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :payment, :integer, default: 0
  end
end
