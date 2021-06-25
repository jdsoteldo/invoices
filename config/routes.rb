Rails.application.routes.draw do
  devise_for :users
  root to: "businesses#index"

  resources :users do
    resources :businesses
  end

  resources :businesses do
    resources :invoices
  end

end
