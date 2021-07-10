# frozen_string_literal: true

class LineItem < ApplicationRecord
  after_create :define_item_type, :create_tax_associations, :adjust_price

  belongs_to :order

  has_many :tax_associations, dependent: :destroy
  has_many :tax_categories, through: :tax_associations

  validates :quantity, numericality: {
    only_integer: true,
    greater_than: -1
  }
  validates :price, numericality: {
    greater_than: 0
  }
end
