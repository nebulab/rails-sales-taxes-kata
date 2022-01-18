class Good < ApplicationRecord
  belongs_to :basket

  before_save :calulate_tax_update_price

  private

  def calulate_tax_update_price
    exampt = %w[chocolate book pills]
    self.basic_tax = round_up(price.to_f.round(2) * 0.1) unless exampt.any? do |exeption|
                                                                  name.include?(exeption)
                                                                end
    self.import_tax = round_up(price.to_f.round(2) * 0.05) if name.include?('imported')
    fprice = quantity.to_f * (price.to_f.round(2) + basic_tax.to_f + import_tax.to_f)
    self.final_price = fprice.round(2)
  end

  def round_up(value)
    (value * 20).ceil / 20.0
  end
end
