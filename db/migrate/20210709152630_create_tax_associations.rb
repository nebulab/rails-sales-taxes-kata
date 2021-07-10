# frozen_string_literal: true

class CreateTaxAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_associations do |t|
      t.references :line_item, null: false, foreign_key: true
      t.references :tax_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
