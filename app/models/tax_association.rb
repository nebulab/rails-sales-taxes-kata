# frozen_string_literal: true

class TaxAssociation < ApplicationRecord
  belongs_to :line_item
  belongs_to :tax_category
end
