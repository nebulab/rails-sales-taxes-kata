class Basket < ApplicationRecord
  has_many :goods, dependent: :destroy
end
