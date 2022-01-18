require 'rails_helper'

RSpec.describe Good, type: :model do
  describe 'associations' do
    it { should belong_to(:basket) }
  end

  describe 'tax calculation' do
    before :each do
      @importexampt = Good.new(name: 'imported chocolat', quantity: '1', price: '10.00')
      @imported = Good.new(name: 'imported', quantity: '1', price: '47.50')
      @exampt = Good.new(name: 'book', quantity: '1', price: '12.49')
      @basic = Good.new(name: 'music', quantity: '1', price: '14.99')
    end

    after :each do
      @importexampt.destroy
      @imported.destroy
      @exampt.destroy
      @basic.destroy
    end

    it 'calcuate basic tax' do
      @basic.save
      expect(@basic.final_price).to be == '16.49'
    end

    it 'calcuate import tax' do
      @importexampt.save
      expect(@importexampt.final_price).to be == '10.50'
    end

    it 'calcuate basic & basic tax' do
      @imported.save
      expect(@imported.final_price).to be == '54.65'
    end

    it 'dont calcuate basic tax' do
      @exampt.save
      expect(@exampt.final_price).to be == '12.49'
    end
  end
end
