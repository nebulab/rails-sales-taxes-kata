module BasketsHelper
  def build_goods(basket)
    entries = basket.handle_file(params[:file])
    entries.each do |entry|
      info = entry.split
      quantity = info[0]
      price = info[-1]
      name = info[1..-3].join(' ')
      good = basket.goods.build(name: name, price: price, quantity: quantity, basic_tax: 0, import_tax: 0)
      good.save
    end
    basket
  end
end
