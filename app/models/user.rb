class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: true,
            :format => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
