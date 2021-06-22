class Public::CartProductsController < Public::Base
    
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @cart_products = @customer.cart_products.all
  end

  def create
    @customer = current_customer
    @cart_product = @customer.cart_products.new(cart_product_params)
    # 以前に追加した商品の情報(すでにカートにある商品)↓
    @now_cart_product = current_customer.cart_products.find_by(product_id: @cart_product.product_id)
    if @now_cart_product
       @now_cart_product.quantity += @cart_product.quantity
        # 数量をさらにupdate
       @now_cart_product.update(quantity: @now_cart_product.quantity)
       redirect_to cart_products_path
    else
      if @cart_product.save
         redirect_to cart_products_path
      else
         flash[:notice] = "カートに入れる個数を入力してください"
         redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    # @customer = current_customer
    # ＠cart_product = Cartproduct.find(params[:id])
    # @cart_product.update(cart_product_params)
    # redirect_to redirect_to public_cart_products_path
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    @customer = Customer.find(current_customer.id)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def destroy_all
    @customer = current_customer
    @customer.cart_products.destroy_all
    redirect_to cart_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :quantity)
  end

end
