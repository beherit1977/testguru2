class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def question_counter
    test.questions.order(:id).where('id < ?', current_question.id).count
  end

  def current_percent(test_passage)
    (100 / test_passage.test.questions.count) * test_passage.correct_questions
  end

  private

  def before_validation_set_first_question
    if test.persisted?
      self.current_question = test.questions.first
    end
  end

  def before_validation_set_next_question
      self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
