FactoryBot.define do
  factory :chocolate, class: 'Good' do
    name { 'imported chocolate' }
    quantity { '1' }
    price { '10.00' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
  factory :perfume, class: 'Good' do
    name { 'imported bottle of perfume' }
    quantity { '1' }
    price { '47.50' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
end
