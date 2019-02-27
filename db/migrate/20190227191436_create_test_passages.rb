class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
    
  add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
  add_column :test_passages, :correct_questions, :integer, default: 0
    
  end
end
