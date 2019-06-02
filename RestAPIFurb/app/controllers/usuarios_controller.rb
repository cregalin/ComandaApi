class UsuariosController < ApplicationController   
    #Listar todos os  usuários
    def index
        usuarios = Usuario.all
        render json: usuarios, status: :ok
    end

    # Listar usuários passando ID 
	def show
        usuario = Usuario.find(params[:id])
        render json: usuario, status: :ok
        #verificar tratamento quando o usuário não é encontrado
    end

    #Cria um novo usuário
    def create
        usuario = Usuario.new(usuario_params)
        if usuario.save
           render json: usuario, status: :ok
        else
           render json: usuario.erros, status: :unprocessable_entity
        end
    end

    #Atualiza um novo usuário
    def update
        usuario = Usuario.find(params[:id])
        if usuario.update_attributes(usuario_params)
            render json: { email: usuario[:email], senha: usuario[:senha] }, status: :ok
        
        else 
            render json: { error: {text: "Usuário não atualizado", data: usuario.erros } }, status: :unprocessable_entity
        end   
        
        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found  
    end

    def destroy
        find_by = params[:id].present? ? {id: params[:id]} : {email: params[:email] }
        usuario = Usuario.find_by(find_by)  
        #passar body     
        if usuario.present?
            usuario.destroy
            render json: { success:{ text: "Usuário removido" }}, status: :ok  
        else
            render json: { success:{ text: "Usuário não encontrado" }}, status: :not_found  
        end
        
        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Usuário não encontrado" } }, status: :not_found  
    end
    
    private

    def usuario_params
        params.require(:usuario).permit(:email, :senha)
    end
end