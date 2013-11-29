class AddPeriodToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :beginning, :datetime
  	add_column :lessons, :ending, :datetime
  end
end
