require 'rails_helper'

RSpec.describe Good, type: :model do
  describe 'associations' do
    it { should belong_to(:basket) }
  end

  describe 'callback calulate_tax_update_price' do
    before do
      basket = create(:basket)
      @imported = create(:imported, basket: basket)
      @exempt = create(:exempt, basket: basket)
      @imported_exempt = create(:importedExempt, basket: basket)
    end

    context 'When imported and not exempt from basic taxe' do
      it 'Updates the basic tax' do
        expect(@imported.basic_tax).to eq('4.75')
      end

      it 'Updates the import tax' do
        expect(@imported.import_tax).to eq('2.4')
      end

      it 'Updates the final price' do
        expect(@imported.final_price).to eq('54.65')
      end
    end

    context 'When imported good exempt from basic taxe' do
      it { expect(@imported_exempt.basic_tax).to eq(nil) }

      it { expect(@imported_exempt.import_tax).to eq('0.5') }

      it { expect(@imported_exempt.final_price).to eq('10.5') }
    end

    context 'When good is exempt from basic taxe' do
      it { expect(@exempt.basic_tax).to eq(nil) }
    end
  end
end
