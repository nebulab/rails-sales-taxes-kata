require 'rails_helper'

RSpec.describe 'Basket upload and show receipt', type: :feature do
  it 'Updates goods price Calculates Sales taxes, total' do
    visit '/baskets/new'
    page.attach_file('file', 'baskets/basket_2.txt')
    click_button 'submit'
    expect(page).to have_content '1 imported bottle of perfume : 54.65'
    expect(page).to have_content 'Sales taxes : 7.65'
    expect(page).to have_content 'Total: 65.15'
  end
end
