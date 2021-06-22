class Product < ApplicationRecord
    attachment :image
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, through: :order_details
  
  
    def add_tax_price
        (self.tax_excluding_price* 1.10).round
    end
  
end
