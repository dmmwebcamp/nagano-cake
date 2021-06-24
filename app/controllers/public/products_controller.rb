class Public::ProductsController < Public::Base
    
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
        # @cart_product = Cart_product.new
    end
end
