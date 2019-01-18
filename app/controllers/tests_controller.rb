class TestsController < ApplicationController
  before_action :find_test, only: %i[show create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end
  
  private
  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render inline: '<h1>Test not found [404]</h1>', status: 404
  end
end
