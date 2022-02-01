require 'rails_helper'

RSpec.describe Good, type: :model do
  let(:basket) { create(:basket) }
  let(:imported) { build(:imported, basket: basket) }
  let(:exempt) { build(:exempt, basket: basket) }
  let(:imported_exempt) { build(:importedExempt, basket: basket) }

  describe 'associations' do
    it { should belong_to(:basket) }
  end

  describe 'save' do
    context 'When imported and not exempt from basic taxe' do
      before do
        imported.save
      end

      it 'Updates the basic tax' do
        expect(imported.basic_tax).to eq('4.75')
      end

      it 'Updates the import tax' do
        expect(imported.import_tax).to eq('2.4')
      end

      it 'Updates the final price' do
        expect(imported.final_price).to eq('54.65')
      end
    end

    context 'When imported good exempt from basic taxe' do
      before do
        imported_exempt.save
      end

      it { expect(imported_exempt.basic_tax).to eq('0') }

      it { expect(imported_exempt.import_tax).to eq('0.5') }

      it { expect(imported_exempt.final_price).to eq('10.5') }
    end

    context 'When good is exempt from basic taxe' do
      it 'Does not Update any taxe' do
        exempt.save
        expect(exempt.basic_tax).to eq('0')
        expect(exempt.import_tax).to eq('0')
      end
    end
  end
end
