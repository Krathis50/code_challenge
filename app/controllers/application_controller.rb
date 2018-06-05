class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:scoreboard_name, :scoreboard_school, :scoreboard_score])
    devise_parameter_sanitizer.permit(:account_update, keys: [:scoreboard_name, :scoreboard_school])
  end
end
