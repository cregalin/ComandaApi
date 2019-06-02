class RestaurantManager < ApplicationRecord
    validates :products, maximum: 200, presence: true
    validates_numericality_of :products_amount, precision: 10, scale: 2, greater_than_or_equal_to: 0
    belongs_to :user
  end
