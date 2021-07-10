# frozen_string_literal: true

class BasketReader
  def self.read_basket(basket)
    basket_contents = File.read(basket).split("\n")
    parse_items(basket_contents)
  end

  def self.parse_items(basket_contents)
    basket_contents.map do |item|
      line_item(item)
    end
  end

  def self.line_item(item)
    quantity = item[0]
    price = item.partition(' at ').last
    description = item.partition(' at ').first[2..]
    LineItem.new(description: description, quantity: quantity, price: price)
  end
end
