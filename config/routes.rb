Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  authenticated :doctor do
    root to: 'doctors#show', as: :authenticated_doctor
  end
  
  authenticated :user do
    root to: 'doctors#index', as: :authenticated_user
  end
  
  unauthenticated do
    root 'pages#home'
  end

  resources :users, only: [ :new, :create, :index, :show ] do 
    resources :appointments, only: [ :new, :create ]
  end

  resources :recommendations, only: [ :show ]
  
  resources :doctors, only: [ :new, :create, :index, :show ] do 
    resources :appointments, only: [ :edit, :update ] do
      resources :recommendations, only: [ :new, :create ]
    end
  end

end
