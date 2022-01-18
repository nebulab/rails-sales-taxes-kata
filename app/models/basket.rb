class Basket < ApplicationRecord
  has_many :goods, dependent: :destroy

  def handle_file(file)
    file.read.split("\n")
  end
end
