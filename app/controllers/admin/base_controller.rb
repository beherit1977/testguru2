class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    if current_user
      redirect_to root_path, alert: 'You are not authorized to view this page' unless
                             current_user.admin?
    end
  end

end