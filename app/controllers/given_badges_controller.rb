# frozen_string_literal: true

class GivenBadgesController < ApplicationController
  def index
    @badges = current_user.badges
  end
end

