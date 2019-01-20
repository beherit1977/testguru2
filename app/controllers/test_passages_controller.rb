class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :edit, :update, :destroy]

  # GET /test_passages
  # GET /test_passages.json
  def index
    @test_passages = TestPassage.all
  end

  # GET /test_passages/1
  # GET /test_passages/1.json
  def show
  end

  # GET /test_passages/new
  def new
    @test_passage = TestPassage.new
  end

  # GET /test_passages/1/edit
  def edit
  end

  # POST /test_passages
  # POST /test_passages.json
  def create
    @test_passage = TestPassage.new(test_passage_params)

    respond_to do |format|
      if @test_passage.save
        format.html { redirect_to @test_passage, notice: 'Test passage was successfully created.' }
        format.json { render :show, status: :created, location: @test_passage }
      else
        format.html { render :new }
        format.json { render json: @test_passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_passages/1
  # PATCH/PUT /test_passages/1.json
  def update
    respond_to do |format|
      if @test_passage.update(test_passage_params)
        format.html { redirect_to @test_passage, notice: 'Test passage was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_passage }
      else
        format.html { render :edit }
        format.json { render json: @test_passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_passages/1
  # DELETE /test_passages/1.json
  def destroy
    @test_passage.destroy
    respond_to do |format|
      format.html { redirect_to test_passages_url, notice: 'Test passage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_passage_params
      params.fetch(:test_passage, {})
    end
end
