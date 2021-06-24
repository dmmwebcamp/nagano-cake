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
  
  private
  #セッションの作成
  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = CartProduct.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart = Cart.create unless current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = current_cart.id
    # Cart情報を返却
    current_cart
  end


end
