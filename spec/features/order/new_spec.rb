# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order Creation Page', type: :feature do
  describe 'I upload a basket 2 list and click create' do
    it 'redirects me to the order show page with an itemized receipt' do
      visit root_path
      attach_file('order[basket_items_file]', Rails.root.join('spec/fixtures/basket_2.txt'))
      click_button('Create')

      expect(page).to have_content('10.50')
      expect(page).to have_content('54.65')
      expect(page).to have_content('7.65')
      expect(page).to have_content('65.15')
    end
  end

  describe 'I upload a basket 1 list and click create' do
    it 'redirects me to the order show page with an itemized receipt' do
      visit root_path
      attach_file('order[basket_items_file]', Rails.root.join('spec/fixtures/basket_1.txt'))
      click_button('Create')

      expect(page).to have_content('12.49')
      expect(page).to have_content('16.49')
      expect(page).to have_content('0.85')
      expect(page).to have_content('1.50')
      expect(page).to have_content('29.83')
    end
  end

  describe 'I upload a basket 3 list and click create' do
    it 'redirects me to the order show page with an itemized receipt' do
      visit root_path
      attach_file('order[basket_items_file]', Rails.root.join('spec/fixtures/basket_3.txt'))
      click_button('Create')

      expect(page).to have_content('32.19')
      expect(page).to have_content('20.89')
      expect(page).to have_content('9.75')
      expect(page).to have_content('11.85')
      expect(page).to have_content('6.70')
      expect(page).to have_content('74.68')
    end
  end
end
