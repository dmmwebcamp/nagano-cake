class Admin::OrderDetailsController < Admin::Base
    
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order  #注文ステータスを更新するため、ordersテーブル呼び出し
    @order_detail.update(order_detail_params)

      #製作ステータスの状態によって条件分岐

      if @order_detail.product_status == "製作中"
        @order.update(status: "製作中")  #もし製作ステータスが1つでも製作中であれば、注文ステータスを製作中に更新
      elsif  @order.order_details.count == @order.order_details.where(product_status: "製作完了").count
        @order.update(status: "発送準備中")  #注文数と製作完了数が一致したとき、注文ステータスを発送準備中に更新
      end

    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
    
end
