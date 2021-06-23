class OrderDetail < ApplicationRecord
    
  belongs_to :product
  belongs_to :order

  validates :tax_including_price, presence: true
  validates :quantity, presence: true, length: {maximum: 100}

  enum product_status: {着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}
  
  
  def subtotal
    tax_including_price * quantity
  end
    
  
  
end