# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def update_totals
    update(order_total: calculate_order_total, sales_tax: calculate_sales_tax)
  end

  def calculate_sales_tax
    return if line_items.empty?

    line_items.sum(:total_taxes)
  end

  def calculate_order_total
    return if line_items.empty?

    line_items.sum(:adjusted_price)
  end
end
