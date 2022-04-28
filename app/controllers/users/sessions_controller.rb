# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  #POST /resource/sign_in
  def create
    super

    salute = current_user.first_name unless current_user.first_name.nil?
    salute =
      if current_user.last_name.nil?
         salute
      else
          current_user.last_name if salute.nil?
          salute + current_user.last_name
       end
    flash[:notice] = "Hello #{ salute ||= current_user.email }"

  end

  private

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
    super
    end
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
