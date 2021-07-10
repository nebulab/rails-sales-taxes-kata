# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TaxCategory.find_or_create_by(name: 'Food') do |tax|
  tax.rate = 0
end

TaxCategory.create!(name: 'Medicine') do |tax|
  tax.rate = 0
end

TaxCategory.create!(name: 'Book') do |tax|
  tax.rate = 0
end

TaxCategory.create!(name: 'Standard Item') do |tax|
  tax.rate = 0.10
end

TaxCategory.create!(name: 'Imported') do |tax|
  tax.rate = 0.05
end
