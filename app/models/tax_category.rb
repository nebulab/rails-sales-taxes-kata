# frozen_string_literal: true

class TaxCategory < ApplicationRecord
  has_many :tax_associations, dependent: :destroy
  has_many :line_items, through: :tax_associations
end
