class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  TAX_EXEMPTION_LIST = %w[chocolate pill book].freeze

  def import(basket_data)
    line_items = []
    File.foreach(basket_data.path) do |line|
      line_item = line.split(' ')
      product = create_product(line_item)
      line_items << create_line_item(product, line_item)
    end
    create_order(line_items)
    self
  end

  private

  def create_product(line_item)
    name = get_product_name(line_item)
    imported = line_item.include?('imported')
    tax_exempt = product_tax_exempt?(name)
    price = line_item[-1].to_f
    un_rounded_tax = calculate_tax(price, tax_exempt, imported)
    tax = ((un_rounded_tax * 20).ceil * 0.05).round(2)

    Product.create!(
      name: name,
      price: price,
      tax: tax
    )
  end

  def get_product_name(line_item)
    name = []
    line_item.each_with_index do |item, index|
      break if line_item[index + 1] == 'at'

      name << (line_item[index + 1])
    end
    name.join(' ')
  end

  def calculate_tax(price, tax_exempt, imported)
    if tax_exempt && imported
      price * 0.05
    elsif !tax_exempt && imported
      price * 0.15
    elsif tax_exempt && !imported
      0
    else
      price * 0.1
    end
  end

  def product_tax_exempt?(name)
    TAX_EXEMPTION_LIST.any? do |category|
      name.include?(category) || name.include?(category.pluralize)
    end
  end

  def create_line_item(product, line_item)
    quantity = line_item[0]
    line_items.build(
      quantity: quantity,
      product_id: product.id
    )
  end

  def calculate_totals(line_items)
    total = 0.0
    total_taxes = 0.0
    line_items.each do |li|
      tax = li.product.tax * li.quantity
      total += (li.product.price * li.quantity) + tax
      total_taxes += tax
    end
    { total: total, total_taxes: total_taxes }
  end

  def create_order(line_items)
    totals = calculate_totals(line_items)
    self.total = totals[:total]
    self.total_taxes = totals[:total_taxes]
    save!
  end
end
