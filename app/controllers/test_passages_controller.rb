class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end
  
  def result
  end

  def update
    if check_timer
      @test_passage.stop!
    else
      @test_passage.accept!(params[:answer_ids])
    end
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgeService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    
    result = GistQuestionService.new(@test_passage.current_question)
    gist_url = result.call
    
    flash_options = 
      if result.success?
        create_gist!(gist_url)
        { notice: t('.success', url: gist_url.html_url) }
      else
        { alert: t('.failed') }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    @test_passage.test.timer_exists? && @test_passage.time_over?
  end

  def create_gist!(gist_url)
    current_user.gists.create(question: @test_passage.current_question, gist_url: gist_url.html_url)
  end
end
