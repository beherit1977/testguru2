module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} question"
    else
      "Edit New #{question.test.title} question"
    end
  end
end
