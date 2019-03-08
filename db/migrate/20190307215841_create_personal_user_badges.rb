class CreatePersonalUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_user_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
