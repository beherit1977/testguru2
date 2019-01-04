class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true

  def by_level(level)
    tests.where(level: level).
        joins("inner join test_passages on test_passages.test_id = tests.id")
        .where("test_passages.user_id = ?", self.id)
  end
end
