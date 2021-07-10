# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'relationships' do
    it { should have_many :line_items }
  end

  describe 'instance methods' do
    let(:order) { Order.create }
    let(:line_item1) { LineItem.new(description: 'imported item', price: 47.50, quantity: 1) }
    let(:line_item2) { LineItem.new(description: 'imported chocolate', price: 10.00, quantity: 1) }
    before do
      order.line_items << line_item1
      order.line_items << line_item2
      line_item1.save
      line_item2.save
    end

    it 'calculate_total' do
      expect(order.calculate_order_total).to eq(65.15)
    end

    it 'calculate_sales_taxes' do
      expect(order.calculate_sales_tax).to eq(7.65)
    end
  end
end
