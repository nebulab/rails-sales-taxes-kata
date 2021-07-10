# frozen_string_literal: true

class LineItem < ApplicationRecord
  after_create :define_item_type, :create_tax_associations

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

  include ItemCategoryHelper

  # As a simple tax calculator, We don't actually have a catalog of items and therefore
  # When an Items model is created, it would include a validated type field and this method
  # can be deprecated.

  def define_item_type
    return unless item_type.nil?

    item_type = 'Food' if food?
    item_type = 'Medicine' if medicine?
    item_type = 'Book' if book?
    item_type ||= 'Standard Item'
    update(item_type: item_type)
  end

  def create_tax_associations
    tax_cat_id = TaxCategory.find_by(name: item_type).id
    TaxAssociation.create(line_item_id: id, tax_category_id: tax_cat_id)
    return unless imported?

    tax_import_id = TaxCategory.find_by(name: 'Imported').id
    TaxAssociation.create(line_item_id: id, tax_category_id: tax_import_id)
  end
end
