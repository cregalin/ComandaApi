class Usuario < ApplicationRecord
    #adicionar criptografia para as senhas

    #has_many :comanda
    validates :email, length: { maximum: 50 }, presence: true
    validates :senha, length: { maximum: 100 }, presence: true
end
