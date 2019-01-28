class SessionsController < ApplicationController

  before_action :authenticate_user!, only: :destroy

  def new
  end

  def create
    user = User.authenticate(email: params[:email])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(cookies.delete(:intended_url) || tests_path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'You have successfully logged out.'
  end

end