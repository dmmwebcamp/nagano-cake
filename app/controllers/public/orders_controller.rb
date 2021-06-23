class Public::OrdersController < Public::Base
  before_action :authenticate_customer!
  
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

	def new
  	@customer = current_customer
    @order = Order.new
	end

	def confirm
		@order = Order.new(order_params)
		@customer = current_customer
		@cart_products = current_customer.cart_products

      total = 0
       current_customer.cart_products.each do |cart_product|
        total += ((1.1 * cart_product.product.tax_excluding_price).floor * cart_product.quantity)
       end
      @order.total_price = total + @order.shipping_fee
        
		# 「ご自身の住所」を選択した場合
		if params[:order][:select_address] == "customer_address"
			@order.postal_code = @customer.postal_code
			@order.address = @customer.address
			@order.recipient = @customer.last_name + @customer.first_name
		# 「登録済住所から選択」を選択した場合
		elsif params[:order][:select_address] == "destination_address"
			@destination = Destination.find(params[:select_destination][:id])
			@order.postal_code = @destination.postal_code
			@order.address = @destination.address
			@order.recipient = @destination.recipient
		# 「新しいお届け先」を選択した場合
		elsif params[:order][:select_address] == "new_destination_address"
			@destination = Destination.new
			@destination.postal_code = params[:order][:postal_code]
			@destination.address = params[:order][:address]
			@destination.recipient = params[:order][:recipient]
			@destination.customer_id = current_customer.id
			if @destination.save
				@order.postal_code = @destination.postal_code
				@order.address = @destination.address
				@order.recipient = @destination.recipient
			else
				render "new"
			end
		end
	end

  def create
  	@order = Order.new(order_params)
  	@order.customer_id = current_customer.id
	@order.save
		
		current_customer.cart_products.each do |cart_product|
		  @order_detail = OrderDetail.new
		  @order_detail.order_id = @order.id
		  @order_detail.product_id = cart_product.product_id
		  @order_detail.quantity = cart_product.quantity
		  @order_detail.tax_including_price = cart_product.product.tax_excluding_price 
		  @order_detail.save
		end

		current_customer.cart_products.destroy_all
		redirect_to orders_thanks_path
  end


  def thanks
  end

	private

	def order_params
		params.require(:order).permit(:postal_code, :address, :recipient, :payment_option, :shipping_fee, :total_price)
	end
  
end
