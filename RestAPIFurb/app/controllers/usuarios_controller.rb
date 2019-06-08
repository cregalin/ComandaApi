class UsuariosController < ApplicationController   
    def index
        usuarios = Usuario.all
        usuarios_return = []
        for usuario in usuarios
            usuarios_return.push({ id: usuario.id, email: usuario.email, senha: usuario.password_digest})
        end
        render json: usuarios_return, status: :ok
    end

    def show
        usuario = Usuario.find(params[:id])
        render json: { id: usuario.id, email: usuario.email, senha: usuario.password_digest}, status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found  
    end

    def create
        usuario = Usuario.new(usuario_params.merge(password: params[:senha], password_confirmation: params[:senha]))
        if usuario.save
            render json: { id: usuario.id, email: usuario.email, senha: usuario.password_digest}, status: :ok
        else
            render json: usuario.errors, status: :unprocessable_entity
        end
    end

    def update
        usuario = Usuario.find(params[:id])
        if usuario.update_attributes(usuario_params.merge(password: params[:senha], password_confirmation: params[:senha]))
            render json: { email: usuario[:email], senha: usuario[:password_digest] }, status: :ok
        else 
            render json: { error: {text: "Usuário não atualizado", data: usuario.errors } }, status: :unprocessable_entity
        end   
        
        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found  
    end

    def destroy
        find_by = params[:id].present? ? { id: params[:id] } : { email: params[:email] }
        usuario = Usuario.find_by(find_by)      

        if usuario.present?
            usuario.destroy
            render json: { success:{ text: "Usuário removido" } }, status: :ok  
        else
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found  
        end

        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found 
    end
    
    private

    def usuario_params
        params.require(:usuario).permit(:email, :senha)
    end
end
