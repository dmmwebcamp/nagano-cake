class Public::HomesController < Public::Base

    def top
        @products = Product.limit(4).order("id")
    end

    def about
    end


end
