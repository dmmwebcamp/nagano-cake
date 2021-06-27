class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :cart_products, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :destinations, dependent: :destroy

   def customer_name
     last_name + first_name
   end

    # 退会済み（is_leaved==true)のユーザーを弾く。customerのis_leavedがfalseならtrueを返す
  def active_for_authentication?
    super && (self.is_leaved == false)
  end
end
