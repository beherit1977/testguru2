class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  end
  
  def show
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def new
    @test = Test.new
  end
  
  def edit
  end
  
  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end
  
  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :edit
    end
  end
  
  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def set_tests
    @tests =Test.all
  end

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
