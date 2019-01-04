class Category < ApplicationRecord
  has_many :tests

  scope :sort_by_name, -> { order(title: :asc) }

  validates :title, presence: true
end
