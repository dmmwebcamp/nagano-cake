class Admin::ProductsController < ApplicationController
    
    
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(genre_params)
        if  @product.save
            redirect_to redirect_back(fallback_location: root_path) 
        else
           redirect_back(fallback_location: root_path) 
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
            redirect_to redirect_back(fallback_location: root_path) 
        else
            render :edit
        end
    end

      
 private
    def product_params
    params.require(:product).permit(:image, :name, :description)  
    end


end
