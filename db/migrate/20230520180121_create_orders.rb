class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :product_count
      t.references :customer_id, null: false, foreign_key: true, type: integer

      t.timestamps
    end
  end
end
