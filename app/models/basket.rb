class Basket < ApplicationRecord
  has_many :goods, dependent: :destroy

  before_save :update_taxes_update_price

  private

  def update_taxes_update_price
    self.sales_taxes = sum_tax
    self.total = sum_total
  end

  def sum_tax
    sum = 0
    goods.each do |entry|
      sum += entry.basic_tax.to_f + entry.import_tax.to_f
    end
    sum.round(2)
  end

  def sum_total
    sum = 0
    goods.each do |entry|
      sum += entry.final_price.to_f
    end
    sum.round(2)
  end
end
