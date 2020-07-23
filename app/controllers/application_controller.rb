class ApplicationController < ActionController::Base
  before_action :authenticate_director!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name dob bio img])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[name dob bio img])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name dob bio image address])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[name dob bio image address])
  end
end
