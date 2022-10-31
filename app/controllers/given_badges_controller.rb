class GivenBadgesController < ApplicationController

  def index
    @badges = current_user.badges
  end

end
