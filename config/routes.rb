Rails.application.routes.draw do

  get 'commission/index'

  get 'commission/employee'

  resources :records
  resources :inventaries
  resources :services
  resources :clients

  devise_for :users

  authenticated :user do
    root 'dashboard#main'
  end
  
  unauthenticated :user do
    root 'dashboard#unregistred'
  end

  get 'users/index'
  get 'commission/pagar'
  get 'inventaries/excel'
  get 'clients/buscar'
  get 'commission/index'
  get 'commission/employee'
  get 'dashboard/main'
  get 'dashboard/main'
  get 'worker/index'
  get 'commission/index'
  post 'record/create'
 

end

