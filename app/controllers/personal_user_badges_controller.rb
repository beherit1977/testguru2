class PersonalUserBadgesController < ApplicationController
  before_action :find_badges, only: %i[index]

  def index
  end

  def find_badges
    @badges = Badge.all
    @personal_badges = current_user.badges
  end
end
