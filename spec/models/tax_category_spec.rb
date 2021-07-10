# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxCategory do
  describe 'relationships' do
    it { should have_many(:line_items).through(:tax_associations) }
  end
end
