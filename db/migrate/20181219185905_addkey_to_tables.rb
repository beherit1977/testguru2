class AddkeyToTables < ActiveRecord::Migration[5.2]
  def up
    add_reference :answers, :question, foreign_key: true, on_delete: :cascade
    add_reference :questions, :test, foreign_key: true, on_delete: :cascade
    add_reference :tests, :category, foreign_key: true
  end
  def down
    remove_reference :answers, :question
    remove_reference :questions, :test
    remove_reference :tests, :category
  end
end
