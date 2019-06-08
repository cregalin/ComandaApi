class Usuario < ApplicationRecord
    #adicionar criptografia para as senhas
    has_secure_password  
    #validates :email, length: { maximum: 50 }, presence: true Usuario.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

    #has_secure_password :senha
end
