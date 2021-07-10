# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :description
      t.integer :quantity
      t.string :item_type
      t.float :price
      t.float :adjusted_price
      t.float :total_taxes

      t.timestamps
    end
  end
end
