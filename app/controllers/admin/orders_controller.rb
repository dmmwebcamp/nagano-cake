class Admin::OrdersController < Admin::Base

before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

      #入金待ちのときは製作ステータスに着手不可が入る
      #入金確認のとき製作ステータスを全て”製作待ち”に更新

      if @order.order_status == "入金待ち"
        @order_details.update_all(made_status: "着手不可")
      elsif @order.order_status == "入金確認"
        @order_details.update_all(made_status: "製作待ち")
      end

    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :recipient, :total_price, :payment_option, :shipping_fee, :status)
  end

end
