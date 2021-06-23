class Public::CartProductsController < Public::Base

   def index
      @customer = current_customer
      @cart_products = CartProduct.all
      @numbers = (1..100).to_a
   end

   def update
      @cart_product = CartProduct.find(params[:id])
      @cart_product.update(cart_product_params)
      redirect_to cart_products_path
   end

   def destroy
      @cart_product = CartProduct.find(params[:id])
      @cart_product.destroy
      redirect_to cart_products_path
   end

   def destroy_all
      @cart_products = CartProduct
      @cart_products.destroy_all
      redirect_to cart_products_path
   end

   def create

      cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
      if cart_product.present?
         cart_product.update(quantity: cart_product.quantity + params[:cart_product][:quantity].to_i)
      else
         @cart_product = CartProduct.new(cart_product_params)
         # deviseの特徴で直接controllerに記載することでIDを取得できる。
         @cart_product.customer_id = current_customer.id
         @cart_product.save
      end
      redirect_to cart_products_path
   end

   private

   def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id)
   end

end
