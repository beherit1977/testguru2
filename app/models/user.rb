class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable,
         :confirmable,
         :validatable
         
         
  has_many :test_passages
  has_many :feedbacks
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists, dependent: :destroy
  has_many :personal_user_badges, dependent: :delete_all
  has_many :badges, through: :personal_user_badges

  def admin?
    self.is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def successful_tests
    self.test_passages.select(&:check_successful)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
