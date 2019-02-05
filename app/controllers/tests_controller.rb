class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end
  
  def show
  end

  def new
    @test = Test.new
  end
  
  def edit
  end
  
  def create
    @test = Test.new(test_params)
    
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end
  
  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end
  
  def destroy
    @test.destroy
  end
  
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
  
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render inline: '<h1>Test not found [404]</h1>', status: 404
  end
end
