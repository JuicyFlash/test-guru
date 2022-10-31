class Admin::BadgesController <  Admin::BaseController

  before_action :find_badge, only: %i[destroy update edit]

  def index
    @badges = Badge.all
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit

  end

  def new
    @badge = Badge.new
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to  admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :rule_type, :rule_description, :rule_value, :picture, :unique)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end