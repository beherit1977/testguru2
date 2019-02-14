class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
    @test_passage.correct_questions
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    if result.success?
      current_user.gists.create!(question: @test_passage.current_question, url: result.response.html_url)
      flash[:notice] = t('.success', url: result.response.html_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
