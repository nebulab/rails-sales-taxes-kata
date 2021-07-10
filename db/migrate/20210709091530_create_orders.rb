class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 10, scale: 2, null: false
      t.decimal :total_taxes, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
