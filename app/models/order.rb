class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    has_many :products, through: :order_details
    
    # enum status:{
    # waiting_for_payment:           0, #入金待ち
    # payment_is_confirmed:          1, #入金確認
    # under_production:              2, #製作中
    # preparing_for_shipping:        3, #発送準備中
    # already_shipped:               4, #発送済み
    # }
    
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}
    
  def total_price
    total_price = 0
    order_details.each do |order_detail|
      total_price += order_detail.subtotal
    end
    total_price
  end
  
  def total_quantity
    total_quantity = 0
    order_details.each do |order_detail|
      total_quantity += order_detail.quantity
    end
    total_quantity
    
  end
  
end
