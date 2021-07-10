class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :product
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
