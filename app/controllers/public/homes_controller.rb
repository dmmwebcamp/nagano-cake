class Public::HomesController < Public::Base

    def top
        @product = Product.order("RANDOM()").limit(1)
        @products = Product.order("RANDOM()").limit(4)
        # @products = Product.limit(4).order("id")
    end

    def about
    end


end
