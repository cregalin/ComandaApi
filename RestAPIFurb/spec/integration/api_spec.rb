require 'swagger_helper'

describe 'RestAPIFurb API' do

  path '/usuarios' do

    post 'Cria um usuário' do
      tags 'Usuários'
      consumes 'application/json'
      parameter name: :usuario, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          senha: { type: :string }
        },
        required: [ 'email', 'senha' ]
      }

      response '200', 'Usuário criado' do
        run_test!
      end

      response '400', 'Requisição inválida' do
        run_test!
      end
    end
  end

  path '/usuarios/{id}' do

    get 'Recupera um usuário' do
      tags 'Usuários'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Usuário encontrado' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            email: { type: :string },
            senha: { type: :string }
          },
          required: [ 'id' ]        
        run_test!
      end

      response '404', 'Usuário não encontrado' do
		schema type: :object,
          properties: {
            error: { type: :object, 
			  properties: {
				text: { type: :string }
			  }
			}
          },
          required: [ 'id' ]
        run_test!
      end
    end
  end
  
  path '/usuarios' do
    get 'Recupera todos os usuários' do
      tags 'Usuários'
      produces 'application/json'
      response '200', 'Usuários encontrados' do
		schema type: :object,
          properties: {
            id: { type: :integer, },
            email: { type: :string },
            senha: { type: :string }
          }
        run_test!
      end      
    end
  end
  
end