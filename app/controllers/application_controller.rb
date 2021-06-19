class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_current_customer

  def get_current_customer
    @customer = current_customer
  end
end
