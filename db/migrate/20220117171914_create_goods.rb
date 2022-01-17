class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :quantity
      t.string :price
      t.string :basic_tax
      t.string :import_tax
      t.string :final_price
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
