class AuthenticateUser
    prepend SimpleCommand
 
    def initialize(email, senha)
        @email = email
        @senha = senha
    end
 
   def call
    JsonWebToken.encode(usuario_id: usuario.id) if usuario
   end

   private

   attr_accessor :email, :senha

   def usuario
    usuario = Usuario.find_by_email(email)
    return usuario if usuario && usuario.authenticate(senha)

    errors.add :user_authentication, 'invalid credentials'
    nil
   end
 
 end