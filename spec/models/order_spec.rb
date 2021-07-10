# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'relationships' do
    it { should have_many :line_items }
  end
end
