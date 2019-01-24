class RemoveIndexTitleTests < ActiveRecord::Migration[5.2]
  def change
    remove_index :tests, :level
  end
end
