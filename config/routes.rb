Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :products do
  end



  get 'products/index'

  root to: "products#index"
  
end
