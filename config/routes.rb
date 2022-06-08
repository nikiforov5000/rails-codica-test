Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [ :new, :create, :index ] do 
    resources :appointments, only: [ :new, :create ] do 
      resources :recommendations, only: [ :show ]
    end
  end
  
  resources :doctors, only: [ :new, :create, :index ] do 
    resources :appointments, only: [ :edit, :update ] do
      resources :recommendations, only: [ :new, :create ]
    end
  end
end
