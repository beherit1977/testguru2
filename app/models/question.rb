class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :text, presence: true
end
