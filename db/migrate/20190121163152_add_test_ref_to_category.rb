class AddTestRefToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :test, foreign_key: true
  end
end
