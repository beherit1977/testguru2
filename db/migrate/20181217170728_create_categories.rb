class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :level
      t.string :title, null: false

      t.timestamps
    end
  end
end
