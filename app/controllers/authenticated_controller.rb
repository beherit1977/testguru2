class AuthenticatedController < ApplicationController
    
  before_action :authenticate_user!

  private
  def authenticate_user!
    unless current_user
      cookies[:path] = request.fullpath
      redirect_to login_path, alert: 'You need to login'
    end
  end
end
