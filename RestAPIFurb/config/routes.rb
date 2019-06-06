Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  scope '/RestApiFurb' do
    resources :usuarios
    resources :comandas
    delete 'usuarios/(:id)',  to: 'usuarios#destroy'
  end
end
