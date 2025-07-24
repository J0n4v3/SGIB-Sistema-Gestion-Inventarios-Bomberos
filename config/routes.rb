Rails.application.routes.draw do
  devise_for :users
  resources :movimientos
  resources :productos

  # Ruta para el estado de salud del sistema
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root dinámico según login
  authenticated :user do
    root to: 'productos#index', as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
