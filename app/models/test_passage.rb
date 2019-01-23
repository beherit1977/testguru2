class TestPassage < ApplicationRecord
belongs_to :test
belongs_to :user
belongs_to :current_question, class_name: 'Question', optional: true

# из видео
before_validation :before_validation_set_first_and_second_question, on: :create
#after_commit :after_commit_set_second_question, on: :create

def accept!(answer_ids)
  self.correct_questions = +1 if correct_answer?(answer_ids)
  self.current_question = next_question
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

# Это из видео кроме next_question
def before_validation_set_first_and_second_question
  if test.persisted?
    self.current_question = test.questions.first
    self.current_question = next_question
  end
end

def correct_answer?(answer_ids)
  (correct_answers.count == correct_answers.where(id: answer_ids).count) && correct_answers.count == answer_ids.count
end

def correct_answers
  current_question.answers.right
end

#это из видео
def next_question
  test.questions.order(:id).where('id > ?', current_question.id).first
end

end
