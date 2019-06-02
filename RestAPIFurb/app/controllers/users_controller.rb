class UsersController < ApplicationController   
    #Listar todos os  usuários
    def index
        users = User.all
        render json: users, status: :ok
    end

    # Listar usuários passando ID 
	def show
        user = User.find(params[:id])
        render json: user, status: :ok
        #verificar tratamento quando o usuário não é encontrado
    end

    #Cria um novo usuário POST
    def create
        #to do test
        debugger
        user = User.new(params["user"])
        debugger
        if user.save
            render json: user, status: :ok
        else
            render json: user.erros, status: :unprocessable_entity
        end
    end

    #PUT
    def update
    end

    def destroy
        #to do
    end

    
    #DELETE
    #DELETE by ID
    #verificar AI no id do usuario e comanda banco de dados
    #validar parametros enviados
end