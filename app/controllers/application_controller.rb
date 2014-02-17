class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # For signing up
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :authenticity_token,
      :username,
      :email,
      :steam_link,
      :region,
      :password,
      :password_confirmation,
      :commit
    ) }

    # For updating account
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :steam_link,
      :region,
      :class_scout,
      :class_soldier,
      :class_pyro,
      :class_demo,
      :class_heavy,
      :class_engineer,
      :class_medic,
      :class_sniper,
      :class_spy,
      :password,
      :password_confirmation,
      :current_password
    ) }
  end

end
