class ComandasController < ActionController::API  
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
        comanda_params.merge(usuario_id: params[:idusuario])
        comanda = Comanda.new(comanda_params)
        if comanda.save
            render json: { idusuario: comanda[:usuario_id], produtos: comanda[:produtos], valortotal: comanda[:valortotal] }, status: :ok
        else
           render json: comanda.errors, status: :unprocessable_entity
        end
    end

    def update        
        comanda = Comanda.find(params[:id])
        comanda_update = comanda_params.merge(usuario_id: params[:idusuario])
        
        if comanda.update_attributes(comanda_update)
            render json: { idusuario: comanda[:usuario_id], produtos: comanda[:produtos], valortotal: comanda[:valortotal] }, status: :ok
        else 
            render json: { error: { text: "Comanda não atualizada", data: comanda.errors } }, status: :unprocessable_entity
        end   
        
        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Comanda não encontrada" } }, status: :not_found
    end

    def destroy
        comanda = Comanda.find(params[:id])  
        debugger
        if comanda.present?
           comanda.destroy
           render json: { success:{ text: "comanda removida" }}, status: :ok  
        end

        rescue ActiveRecord::RecordNotFound
            render json: { error: { text: "Comanda não encontrada" } }, status: :not_found  
    end

    
    private

    def comanda_params
       comanda_params = params.require(:comanda).permit(:idusuario, :produtos, :valortotal)
    end
end