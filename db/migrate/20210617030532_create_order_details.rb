class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :tax_including_price, null: false
      t.integer :quantity, null: false
      t.integer :product_status, null: false, default:0

      t.timestamps
    end
  end
end
