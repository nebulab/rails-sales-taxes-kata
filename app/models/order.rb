# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
end
