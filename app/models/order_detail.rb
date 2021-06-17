class OrderDetail < ApplicationRecord
    
    belongs_to :product
    belongs_to :order
    
    enum product_status:{
    unable_to_produce:              0, #着手不可
    waiting_for_production:         1, #製作待ち
    under_production:               2, #製作中
    completed_production:           3, #製作完了
    }
end
