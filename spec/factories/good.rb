FactoryBot.define do
  factory :good do
    name { 'Importedgood' }
    quantity { '1' }
    price { '47.50' }
    basic_tax { '0' }
    import_tax { '0' }
    final_price { '0' }
  end
end
