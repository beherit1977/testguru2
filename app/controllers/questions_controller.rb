class QuestionsController < ApplicationController
  
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end
  
  def edit
  end

   def create
    @question =  @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end


  def update
    if @question.update(question_params)
      redirect_to @question.test, notice: 'Answer was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render inline: 'Question not found [404]', status: 404
  end
end
