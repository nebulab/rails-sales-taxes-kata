require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'associations' do
    it { should have_many(:goods) }
  end
end
