class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :low_level, -> { where(level: 0..1) }
  scope :normal_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (name) {
    joins(:category).where(categories: {title: name})
        .order(title: :desc)
  }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: {only_integer: true}
  validates_numericality_of :level, greater_than: 0
  end
end
