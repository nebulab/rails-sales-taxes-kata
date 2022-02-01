class Good < ApplicationRecord
  EXEMPT_FROM_TAX = %w[chocolate book pills].freeze
  BASIC_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05
  PRESITION = 20.0

  belongs_to :basket

  before_save :calulate_tax_update_price

  private

  def calulate_tax_update_price
    self.basic_tax = calcul_basic_tax
    self.import_tax = calcul_import_tax
    self.final_price = calcul_final_price
  end

  def calcul_basic_tax
    return round_up(price.to_f.round(2) * BASIC_TAX_RATE) unless EXEMPT_FROM_TAX.any? do |exception|
      name.include?(exception)
    end

    '0'
  end

  def calcul_import_tax
    return round_up(price.to_f.round(2) * IMPORT_TAX_RATE) if name.include?('imported')

    '0'
  end

  def calcul_final_price
    (quantity.to_f * (price.to_f.round(2) + basic_tax.to_f + import_tax.to_f)).round(2)
  end

  def round_up(value)
    (value * PRESITION).ceil / PRESITION
  end
end
