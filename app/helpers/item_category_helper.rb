# frozen_string_literal: true

module ItemCategoryHelper
  def food?
    foods = ['chocolate']
    foods.any? { |food| description.include?(food) }
  end

  def medicine?
    medicines = ['pills']
    medicines.any? { |medicine| description.include?(medicine) }
  end

  def book?
    books = ['book']
    books.any? { |book| description.include?(book) }
  end

  def imported?
    description.split.include?('imported')
  end
end
