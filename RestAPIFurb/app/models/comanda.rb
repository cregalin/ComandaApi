class Comanda < ApplicationRecord
    validates :produtos, length: { maximum: 200 }, presence: true
    validates_numericality_of :valortotal, precision: 10, scale: 2, greater_than_or_equal_to: 0
    belongs_to :usuario
  end
