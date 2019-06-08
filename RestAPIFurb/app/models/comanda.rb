class Comanda < ApplicationRecord
    validates :produtos, length: { maximum: 200 }, presence: true
    #precision: 10, scale: 2, - verificar essa validaçâo
    validates_numericality_of :valortotal, greater_than_or_equal_to: 0, presence: true
    belongs_to :usuario
  end
