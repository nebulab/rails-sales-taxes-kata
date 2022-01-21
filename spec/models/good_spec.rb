require 'rails_helper'

RSpec.describe Good, type: :model do
  describe 'associations' do
    it { should belong_to(:basket) }
  end

  describe 'test callback method calulate_tax_update_price' do
    before do
      basket = create(:basket)
      @good = create(:perfume, basket: basket)
      @choco = create(:chocolate, basket: basket)
    end

    it 'Updates the basic tax before saving' do
      expect(@good.basic_tax).to eq('4.75')
    end

    it 'Updates the import tax before saving' do
      expect(@good.import_tax).to eq('2.4')
    end

    it 'Updates the final price before saving' do
      expect(@good.final_price).to eq('54.65')
    end

    it 'Does not Update the basic tax before saving for exempt products' do
      expect(@choco.basic_tax).to eq(nil)
    end
  end
end
