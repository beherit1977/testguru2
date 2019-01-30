class ApplicationController < ActionController::Base
  I18n.config.available_locales = :ru
  I18n.config.default_locale = :ru

  helper_method :current_user,
                :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
