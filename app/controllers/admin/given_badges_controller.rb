class Admin::GivenBadgesController <  Admin::BaseController
  def index
    redirect_to given_badges_path
  end
end
