Rails.application.routes.draw do
  get 'products/done/:id', to: 'products#done'
  
  get 'products/cancel/:id', to: 'products#cancel'
  
  get 'products/view_orders/', to: 'products#view_orders'
  
  get 'cart/new'

  post 'products/add/', to: 'products#add'

  get 'cart/delete'

  get 'cart/erase'

  get 'cart/create'

  get 'cart/show'

  get 'session/new'
  
  post 'session/create'
  
  get 'session/destroy'
  
  get 'users/create'
  
  get 'users/new'
  
  get '/users/show/:id', to: 'users#show'
  
  get 'users/edit/', to: 'users#edit'
  
  get 'users/index', to: 'users#index'

  post 'users/update/', to: 'users#update'
  
  get 'users/destroy/', to: 'users#destroy'

  resources :products

  get 'main_page/main'

  get 'main_page/adress'

  get 'main_page/contacts'

  get 'main_page/uzn_bol'
  
  root 'main_page#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
