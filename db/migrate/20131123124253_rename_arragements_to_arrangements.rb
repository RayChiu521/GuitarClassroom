class RenameArragementsToArrangements < ActiveRecord::Migration
  def change
  	rename_table :arragements, :arrangements
  end
end
