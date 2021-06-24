
class Public::CustomersController < Public::Base


   def show
    @customer = current_customer
   end

   def edit
     @customer = current_customer
   end

   def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
   end

# 退会ページの表示
   def leave

   end

# 退会処理
   def withdraw
      @customer = current_customer
        #is_deletedカラムにフラグを立てる(defaultはfalse)
      @customer.update(is_leaved: true)
        #ログアウトさせる
      reset_session
      flash[:notice] = "ユーザー退会完了！"
      redirect_to root_path
   end

private
    def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :is_leaved)
    end
end