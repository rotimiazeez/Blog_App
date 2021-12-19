class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  # end
end
