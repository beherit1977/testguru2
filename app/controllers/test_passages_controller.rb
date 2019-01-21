class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show
  end

  def update
  @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
    redirect_to result_test_passage_path(@test_passage)
    else
    render :show
    end
  end

  def result
  @test_passage.correct_questions
  end

  private


  def test_passage_params
  params.require(:test_passage).permit(:body, :correct)
  end

  def set_test_passage
  @test_passage = TestPassage.find(params[:id])
  end
end