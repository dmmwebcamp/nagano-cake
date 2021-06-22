class Admin::OrderDetailsController < Admin::Base
    
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order  #注文ステータスを更新するため、ordersテーブル呼び出し
    @order_product.update(order_product_params)

      #製作ステータスの状態によって条件分岐

      if @order_product.made_status == "製作中"
        @order.update(order_status: "製作中")  #もし製作ステータスが1つでも製作中であれば、注文ステータスを製作中に更新
      elsif  @order.order_products.count == @order.order_products.where(made_status: "製作完了").count
        @order.update(order_status: "発送準備中")  #注文数と製作完了数が一致したとき、注文ステータスを発送準備中に更新
      end

    redirect_to admin_order_path(@order.id)
  end

  private
  def order_product_params
    params.require(:order_product).permit(:product_status)
  end
    
end
