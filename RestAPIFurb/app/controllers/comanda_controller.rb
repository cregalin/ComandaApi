class ComandaController < ApplicationController  
    def index
        comandas = Comanda.all
        render json: comandas, status: :ok
    end

    def show
        comanda = Comanda.find(params[:id])
        render json: comanda, status: :ok

        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Comanda não encontrada" } }, status: :not_found  
    end

    def create
    end

    #PUT
    def update
    end

    def destroy
    end

    
    #DELETE
    #DELETE by ID
    #verificar AI comanda banco de dados
    #validar parametros enviados
end