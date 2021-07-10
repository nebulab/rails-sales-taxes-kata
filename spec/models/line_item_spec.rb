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
end
