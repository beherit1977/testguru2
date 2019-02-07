class RemoveNullConsNameUsers < ActiveRecord::Migration[5.2]

  def change
    change_column :users, :name, :string, :null => true
  end

end
