class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  
  SUCCESS_PASSAGE = 85

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
  
  #overall percent of correct answers
  def current_percent
    (correct_questions.to_f/test.questions.count*100).round(2)
  end
  
  def current_progress_percent(test_passage)
    (100 / test_passage.test.questions.count) * questions_left
  end
  
  def question_number
    self.question_counter + 1
  end
  
  def success_test?
  	current_percent >= SUCCESS_PASSAGE
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
    (correct_answers.count == correct_answers.where(id: answer_ids).count) && 
    correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
  
  def questions_left
    test.questions.order(:id).where('id < ?', current_question.id).count
  end
end
