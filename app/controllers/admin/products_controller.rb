class Admin::ProductsController < ApplicationController
    
    
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if  @product.save
            redirect_to admin_product_path(@product.id)
        else
           render :new
        end
    end 
    
    def show
        @product = Product.find(params[:id])
    end 
    
    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find(params[:id])
        if  @product.update(product_params)
            redirect_to admin_product_path(@product.id)
        else
            render :edit
        end
    end

      
 private
    def product_params
    params.require(:product).permit(:image, :name, :description, :tax_excluding_price, :genre_id, :is_saled)  
    end


end
