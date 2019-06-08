Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  scope '/RestApiFurb' do
    resources :usuarios, :comandas
    delete 'usuarios/(:id)',  to: 'usuarios#destroy'
    post 'authenticate', to: 'authentication#authenticate'
  end
end
