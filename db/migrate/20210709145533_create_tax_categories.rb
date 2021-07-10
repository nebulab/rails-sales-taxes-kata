# frozen_string_literal: true

class CreateTaxCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_categories do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
