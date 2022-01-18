require 'rails_helper'

RSpec.describe Good, type: :model do
  describe 'associations' do
    it { should belong_to(:basket) }
  end
end
