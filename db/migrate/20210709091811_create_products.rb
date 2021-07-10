class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :tax, precision: 10, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
