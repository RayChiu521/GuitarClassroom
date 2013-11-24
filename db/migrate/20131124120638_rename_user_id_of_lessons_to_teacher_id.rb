class RenameUserIdOfLessonsToTeacherId < ActiveRecord::Migration
  def change
  	rename_column :lessons, :user_id, :teacher_id
  end
end
