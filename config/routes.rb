Rails.application.routes.draw do

  get 'welcome/index'

  get 'commission/index'

  get 'commission/employee'
  devise_for :users
  resources :records
  resources :inventaries
  resources :services
  resources :clients

  resources :users, :except => [:show, :create, :update]
  



  authenticated :user do
    root 'dashboard#main'
  end
  
  unauthenticated :user do
    root 'welcome#index'
  end
  

  get 'usuarios' => 'users#index'
  get 'nuevo' => 'users#nuevo'
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

