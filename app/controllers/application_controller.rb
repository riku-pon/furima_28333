class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

   def basic_auth
     authenticate_or_request_with_http_basic do |username, password|
      username == 'rikupon' && password == '109315'
     end
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :phonetic_family_name, :phonetic_first_name, :birthday])
  end
end
