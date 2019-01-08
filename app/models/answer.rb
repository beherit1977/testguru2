class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :validate_answers, on: :create

  def validate_answers
    errors.add(:answers_size, 'Too many answers were made') if question.answers.size >= 4
  end
end
