FactoryBot.define do
  factory :exempt, class: 'Good' do
    name { 'chocolate' }
    quantity { '1' }
    price { '10.00' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
  factory :imported, class: 'Good' do
    name { 'imported bottle of perfume' }
    quantity { '1' }
    price { '47.50' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
  factory :importedExempt, class: 'Good' do
    name { 'imported box of chocolates' }
    quantity { '1' }
    price { '10.00' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
end
