Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :usuarios
  delete 'usuarios/(:id)', to: 'usuarios#destroy'

  resources :comandas
  delete 'comandas/(:id)', to: 'comandas#destroy'
end
