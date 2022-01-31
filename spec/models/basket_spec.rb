require 'rails_helper'

RSpec.describe Basket, type: :model do
  let(:filepath) { Rails.root.join('baskets', 'basket_2.txt') }
  let(:file) { Rack::Test::UploadedFile.new(filepath, 'txt') }
  let(:basket) { create(:basket) }

  before do
    basket.build_goods_from_file_upload(file)
  end

  describe 'associations' do
    it { should have_many(:goods) }
  end

  describe 'Build goods from file appload' do
    it { expect(basket.goods.size).to eq(2) }
  end

  describe 'save' do
    context 'When basket not saved' do
      it { expect(basket.sales_taxes).to eq('0') }
      it { expect(basket.total).to eq('0') }
    end

    context 'When basket saved' do
      before do
        basket.save
      end
      it { expect(basket.sales_taxes).to eq('7.65') }
      it { expect(basket.total).to eq('65.15') }
    end
  end
end
