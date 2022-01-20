require 'rails_helper'

RSpec.describe 'Basket upload and show receipt', type: :feature do
  before :each do
    visit '/baskets/new'
    page.attach_file('file', 'baskets/basket_2.txt')
    click_button 'submit'
  end

  it 'uploads basket' do
    expect(page).to have_content 'imported bottle of perfume'
  end

  it 'calculate Sales taxes' do
    expect(page).to have_content 'Sales taxes : 7.65'
  end

  it 'calculate Total' do
    expect(page).to have_content 'Total: 65.15'
  end

  it 'Update goods price' do
    expect(page).to have_content '1 imported bottle of perfume : 54.65'
  end
end
