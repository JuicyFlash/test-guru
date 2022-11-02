# frozen_string_literal: true

module Admin
  class GivenBadgesController < Admin::BaseController
    def index
      redirect_to given_badges_path
    end
  end
end

