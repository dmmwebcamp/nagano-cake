class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :total_price, null: false
      t.integer :payment_option, null: false
      t.integer :shipping_fee, null: false
      t.integer :status, null: false, default:0
      t.string :postal_code, null: false
      t.text :address, null: false
      t.string :recipient, null: false

      t.timestamps
    end
  end
end
