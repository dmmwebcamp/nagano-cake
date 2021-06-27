class Public::ProductsController < Public::Base

    def index
        @products = Product.page(params[:page]).per(8)
    end

    def show
        @product = Product.find(params[:id])
        @cart_product = CartProduct.new

    end

    
end
