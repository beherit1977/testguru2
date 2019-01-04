class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :text, presence: true
  validate :validate_answers, on: :create

  def validate_answers
    errors.add(:base) if question.answers.size >= 4
  end
end
