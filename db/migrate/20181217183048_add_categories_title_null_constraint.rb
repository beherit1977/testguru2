class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :level, false)
  end

  def down
    change_column_null(:categories, :title, false)
    change_column_null(:categories, :level, true)
  end
end
