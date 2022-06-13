Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  devise_scope :user do
    authenticated :user do
      root 'doctors#index', as: :authenticated_user_root
    end

    authenticated :doctor do
      root 'doctors#show', as: :authenticated_doctor_root
    end
    
    unauthenticated do
      root 'pages#home'
      # root 'devise/sessions#new', as: :unauthenticated_root
      # raise
    end
  end

  resources :users, only: [ :new, :create, :index, :show ] do 
    resources :appointments, only: [ :new, :create ] do 
      resources :recommendations, only: [ :show ]
    end
  end
  
  resources :doctors, only: [ :new, :create, :index, :show ] do 
    resources :appointments, only: [ :edit, :update ] do
      resources :recommendations, only: [ :new, :create ]
    end

  end
end
