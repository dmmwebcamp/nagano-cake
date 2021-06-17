class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.integer :customer_id, null: false
      t.string :pastal_code, null: false
      t.string :address, null: false
      t.string :recipient, null: false

      t.timestamps
    end
  end
end
