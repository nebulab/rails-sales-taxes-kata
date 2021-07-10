# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :order_total
      t.float :sales_tax

      t.timestamps
    end
  end
end
