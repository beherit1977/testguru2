class RemoveIndexLevelTests < ActiveRecord::Migration[5.2]
  def change
    remove_index :tests, :title
  end
end
