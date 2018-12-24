class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category(name)
    Test.where("categories.title = ?", name).
        joins("inner join categories on categories.id = tests.category_id")
        .order(id: :desc)
        .pluck(:title)
  end
end
