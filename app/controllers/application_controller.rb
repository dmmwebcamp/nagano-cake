class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_current_customer

  def get_current_customer
    @customer = current_customer
  end

 

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
  end

  layout :layout_by_resource
  def layout_by_resource
    if devise_controller?
      "public"
    else
      "application"
    end
  end


end
