require 'swagger_helper'

describe 'RestAPIFurb API' do
  
  path '/usuarios' do
	get 'Recupera todos os usuários' do
      tags 'GETs Usuários'
      produces 'application/json'
      response '200', 'Usuários encontrados' do
		schema type: :array,
		  items: { type: :object,
			properties: {
			  id: { type: :integer, },
			  email: { type: :string },
			  senha: { type: :string }
			}
          }		
        run_test!
      end      
    end
	
	post 'Cria um usuário' do
      tags 'POST Usuários'
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
        schema type: :object,
          properties: {
            id: { type: :integer, },
            email: { type: :string },
            senha: { type: :string }
          },
          required: [ 'id' ]
		run_test!
      end

      response '400', 'Requisição inválida' do
        run_test!
      end
    end
	
	delete 'Deleta um usuário' do
      tags 'DELETEs Usuários'
      produces 'application/json'
      parameter name: :usuario, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string }
        },
        required: [ 'email' ]
      }

      response '200', 'Usuário removido' do
        schema type: :object,
          properties: {
            success: { type: :object, 
			  properties: {
				text: { type: :string }
			  }
			}
          }
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
          }
        run_test!
      end
    end
	
  end
  
  path '/usuarios/{id}' do    
	
	get 'Recupera um usuário' do
      tags 'GETs Usuários'
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
	
	put 'Atualiza um usuário' do
      tags 'PUT Usuários'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

	  parameter name: :usuario, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          senha: { type: :string }
        },
        required: [ 'email', 'senha' ]
      }
	  
      response '200', 'Usuário atualizado' do
        schema type: :object,
          properties: {
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
	
	delete 'Deleta um usuário' do
      tags 'DELETEs Usuários'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Usuário removido' do
        schema type: :object,
          properties: {
            success: { type: :object, 
			  properties: {
				text: { type: :string }
			  }
			}
          }
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
  
end