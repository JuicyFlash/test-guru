class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]

  def new; end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:origin_path) || tests_path
    else
      flash.now[:alert] = 'Verify your Email and Password'
      render :new
    end

  end
end
