# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxAssociation, type: :model do
  describe 'relationships' do
    it { should belong_to :line_item }
    it { should belong_to :tax_category }
  end
end
