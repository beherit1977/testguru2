class PersonalUserBadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    find_badges
  end

  private
  def find_badges
    @badges = Badge.all
    @personal_badges = current_user.badges
  end
end
