# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem do
  describe 'validations' do
    it do
      should validate_numericality_of(:price).is_greater_than(0)
      should validate_numericality_of(:quantity).is_greater_than(-1)
    end
  end

  describe 'relationships' do
    it { should belong_to :order }
    it { should have_many(:tax_categories).through(:tax_associations) }
  end

  describe 'Instance Methods' do
    describe 'tax_categories' do
      context 'with single tax category' do
        subject do
          described_class.create(description: 'chocolate bar', price: 0.85, quantity: 1, order_id: Order.create.id)
        end

        it { expect(subject.tax_categories.first.name).to eq('Food') }
      end

      context 'with multiple tax categories' do
        subject do
          described_class.create(description: 'imported chocolates',
                                 price: 10.00,
                                 quantity: 1,
                                 order_id: Order.create.id)
        end

        it { expect(subject.tax_categories.first.name).to eq('Food') }
        it { expect(subject.tax_categories.last.name).to eq('Imported') }
      end

      context 'with Not a food, medicine or book' do
        subject do
          described_class.create(description: 'imported perfume bottle',
                                 price: 47.50,
                                 quantity: 1,
                                 order_id: Order.create.id)
        end

        it { expect(subject.tax_categories.first.name).to eq('Standard Item') }
        it { expect(subject.tax_categories.last.name).to eq('Imported') }
      end
    end
  end
end
