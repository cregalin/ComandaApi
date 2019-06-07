require 'swagger_helper'

describe 'RestAPIFurb API' do
  
  path '/RestApiFurb/usuarios' do
	get 'Recupera todos os usuários' do
      tags 'GET Usuários'
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
        required: [ 'usuario' ]
      }

      response '200', 'Usuário criado' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            email: { type: :string },
            senha: { type: :string }
          }          
		run_test!
      end

      response '400', 'Requisição inválida' do
        run_test!
      end
    end
	
	delete 'Deleta um usuário' do
      tags 'DELETE Usuários'
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
	  
	  response '400', 'Requisição inválida' do
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
  
  path '/RestApiFurb/usuarios/{id}' do    
	
	get 'Recupera um usuário' do
      tags 'GET Usuários'
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
	  
	  response '400', 'Requisição inválida' do
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
	  
	  response '400', 'Requisição inválida' do
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
      tags 'DELETE Usuários'
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
	  
	  response '400', 'Requisição inválida' do
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
  
  path '/RestApiFurb/comandas' do
	
	get 'Recupera todas as comandas' do
      tags 'GET Comandas'
      produces 'application/json'
      response '200', 'Comandas encontradas' do
		schema type: :array,
		  items: { type: :object,
			properties: {
			  id: { type: :integer, },
			  idusuario: { type: :integer, },
			  produtos: { type: :string },
			  valortotal: { type: :string }
			}
          }		
        run_test!
      end      
    end
	
	post 'Cria uma comanda' do
      tags 'POST Comandas'
      consumes 'application/json'
      parameter name: :comanda, in: :body, schema: {
        type: :object,
        properties: {
          idusuario: { type: :integer },
          produtos: { type: :string },
		  valortotal: { type: :number }
        },
        required: [ 'idusuario', 'produtos', 'valortotal' ]
      }

      response '200', 'Comanda criada' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            idusuario: { type: :integer },
			produtos: { type: :string },
			valortotal: { type: :number }
          }
		run_test!
      end
	  
	  response '400', 'Requisição inválida' do
        run_test!
      end
      
    end
	
  end
  
  path '/RestApiFurb/comandas/{id}' do
	
	get 'Recupera uma comanda' do
      tags 'GET Comandas'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Comanda encontrada' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            idusuario: { type: :integer },
			produtos: { type: :string },
			valortotal: { type: :number }
          },
          required: [ 'id' ]
        run_test!
      end
	  
	  response '400', 'Requisição inválida' do
        run_test!
      end

      response '404', 'Comanda não encontrada' do
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
	
	put 'Atualiza uma comanda' do
      tags 'PUT Comanda'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

	  parameter name: :comanda, in: :body, schema: {
        type: :object,
        properties: {
          idusuario: { type: :integer },
		  produtos: { type: :string },
		  valortotal: { type: :number }
        },
        required: [ 'idusuario', 'produtos', 'valortotal' ]
      }
	  
      response '200', 'Comanda atualizada' do
        schema type: :object,
          properties: {
            idusuario: { type: :integer },
		    produtos: { type: :string },
		    valortotal: { type: :number }
          },
          required: [ 'id' ]
        run_test!
      end
	  
	  response '400', 'Requisição inválida' do
        run_test!
      end

      response '404', 'Comanda não encontrada' do
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
	
	delete 'Deleta uma comanda' do
      tags 'DELETE Comanda'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'Comanda removida' do
        schema type: :object,
          properties: {
            success: { type: :object, 
			  properties: {
				text: { type: :string }
			  }
			}
          },
          required: [ 'id' ]
        run_test!
      end
	  
	  response '400', 'Requisição inválida' do
        run_test!
      end

      response '404', 'Comanda não encontrada' do
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