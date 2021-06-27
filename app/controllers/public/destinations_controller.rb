class Public::DestinationsController < Public::Base

  def index
    @destination = Destination.new
    @customer = current_customer
    @destinations = @customer.destinations
  end
  
  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
      flash[:success] = "新しい配送先の登録が完了しました。"
      redirect_to destinations_path
    else
      @customer = current_customer
      @destinations = @customer.destinations
      flash[:danger] = "新しい配送先内容に不備があります。"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end
  
  def update
     @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
       flash[:success] = "配送先の変更内容を保存しました。"
       redirect_to destinations_path
    else
       flash[:danger] = "配送先の変更内容に不備があります。"
       redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @destination = Destination.find(params[:id])
    @destination.customer_id = current_customer.id
    @destination.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to destinations_path
  end
  
  private
  def destination_params
    params.require(:destination).permit(:postal_code, :address, :recipient)
  end
  
end
