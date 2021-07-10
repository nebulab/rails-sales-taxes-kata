# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_09_152630) do
  create_table "line_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "description"
    t.integer "quantity"
    t.string "item_type"
    t.float "price"
    t.float "adjusted_price"
    t.float "total_taxes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "order_total"
    t.float "sales_tax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tax_associations", force: :cascade do |t|
    t.integer "line_item_id", null: false
    t.integer "tax_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_item_id"], name: "index_tax_associations_on_line_item_id"
    t.index ["tax_category_id"], name: "index_tax_associations_on_tax_category_id"
  end

  create_table "tax_categories", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "tax_associations", "line_items"
  add_foreign_key "tax_associations", "tax_categories"
end
