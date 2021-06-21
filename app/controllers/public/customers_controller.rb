class Public::CustomersController < Public::Base
    
   def show
   end
    
   def edit
   end
    
   def update
   end
    
   def leave
   end
    
   def withdraw
   end 
   
    def destroy
     @customer = Customer.find(params[:id])
     @customer.destroy
     redirect_to admin_customers_path
    end

end
