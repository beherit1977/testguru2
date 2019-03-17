class TestPassage < ApplicationRecord
  
  SUCCESS_PASSAGE = 85
  
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_save :check_successful
  
  scope :by_category, -> (category) { joins(:test).
                                            where(tests: {category: category}) }

  scope :by_level, -> (level) { joins(:test).
                                      where(tests: {level: level}) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end
  
  #how many questions answered
  def question_counter
    test.questions.order(:id).where('id < ?', current_question.id).count
  end
  
  #overall percent of correct questions if answers to the questions present
  def current_percent
    (self.correct_questions.to_f / self.test.questions.count) * 100

    # questions_with_answers = test.questions.count {|q| q.answers.present?}
    # (correct_questions.to_f/questions_with_answers*100).round(2)
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
  
  def check_successful
    self.completed? && self.success_test?
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
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort if current_question.answers.present?
  end

  def correct_answers
    current_question.answers.correct if current_question.answers.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
  
  def questions_left
    test.questions.order(:id).where('id < ?', current_question.id).count
  end
end
