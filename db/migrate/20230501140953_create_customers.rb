class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.references :customer_id, null: false, foreign_key: true, type: integer

      t.timestamps
    end
  end
end
