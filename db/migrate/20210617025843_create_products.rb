class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :image_id, null: false
      t.string :name, null: false
      t.string :description
      t.integer :tax_excluding_price, null: false
      t.boolean :is_saled, null: false, default: false

      t.timestamps
    end
  end
end
