class Public::CustomersController < ApplicationController

   def show
    @customer = Customer.find(params[:id])
   end

   def edit
     @customer = Customer.find(params[:id])
   end

   def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
   end

# 退会ページの表示
   def leave

   end

# 退会処理
   def withdraw

   end

private
    def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email)
    end
end