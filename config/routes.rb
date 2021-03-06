Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get  'addresses', to: 'users/registrations#new_address'
    get "users/show",to: "users#show"
    get "users/card", to: "users#card"
    get "users/products",to:"users#products"
    get "users/logout", to: "users#logout"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :products do
    collection do
      get "set_images" 
      get "update_done" 
    end
  end

  get 'products/index'

  root to: "products#index"

 
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'
  
end
