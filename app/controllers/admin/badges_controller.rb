class Admin::BadgesController < ApplicationController

  before_action :find_badge, only: %i[show update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = current_user.author_badges.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.success') 
    else
      render :new
    end
  end

  def update
   if @badge.update(badge_params)
      redirect_to [:admin, @badge] 
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :rule_type, 
                                  :rule_value, :image_path)
  end  

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
