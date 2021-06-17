class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum status:{
    waiting_for_payment:           0, #入金待ち
    payment_is_confirmed:          1, #入金確認
    under_production:              2, #製作中
    preparing_for_shipping:        3, #発送準備中
    already_shipped:               4, #発送済み
    }
end
