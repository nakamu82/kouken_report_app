Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions" }

  root "home#index"

  resource :user, only: [:show]
  
  resources :clients do
    resources :deposits
    resources :securities
    resources :insurances
    resources :real_estates
    resources :claims
    resources :other_properties
    resources :debts
    resources :inheritance_properties
  end

  # 記録使わなければ削除
  resources :records do
    collection do
      post "confirm"
    end
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  get "exports/zaisan/:id", to: "exports#zaisan"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
