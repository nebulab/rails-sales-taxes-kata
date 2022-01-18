class Good < ApplicationRecord
  belongs_to :basket

  before_save :calulate_tax_update_price

  private

  def calulate_tax_update_price
    exampt = %w[chocolate book pills]
    self.basic_tax = (price.to_f.round(2) * 0.1).round(2) unless exampt.any? do |exeption|
                                                                   name.include?(exeption)
                                                                 end
    self.import_tax = (price.to_f.round(2) * 0.05).round(2) if name.include?('imported')
    fprice = quantity.to_f * (price.to_f.round(2) + basic_tax.to_f.round(2) + import_tax.to_f.round(2))
    self.final_price = fprice.round(2)
  end
end
