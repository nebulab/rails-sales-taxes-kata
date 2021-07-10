# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Order Creation Page', type: :feature do
  describe 'I upload a basket list and click create' do
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
end
