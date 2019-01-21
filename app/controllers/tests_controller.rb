class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  @tests = Test.all
  end

  def new
  @test = Test.new
  end

  def destroy
  @test.destroy
  end

  def show
  end

  def edit
  end

  def start
  if @test.questions.count.positive?
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  else
    redirect_to root_path, notice: 'Нету вопросов'
  end
  end

  private

  def find_test
  @test = Test.find(params[:id])
  end

  def set_user
  @user = User.first
  end

  def rescue_with_test_not_found
  render inline: '<h1>Test not found [404]</h1>', status: 404
  end
end
