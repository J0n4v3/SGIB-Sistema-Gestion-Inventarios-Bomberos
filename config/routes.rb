Rails.application.routes.draw do
  get "dashboard/index"
  get "dashboard", to: "dashboard#index", as: :dashboard

  resources :categories
  resources :movimientos
  resources :productos
  resources :ajustes, only: [ :index, :new, :create ]
  resources :mantenimientos do
    member do
      patch :completar
    end
  end

  # Rutas para usuarios
  resources :usuarios, only: [ :index, :update, :create, :new ], controller: "usuarios"

  # Devise
  devise_for :users, skip: [ :registrations ]

  # Ruta para el estado de salud del sistema
  get "up" => "rails/health#show", as: :rails_health_check


  #Root global
  root to: "dashboard#index"

  # Root dinámico según login
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
