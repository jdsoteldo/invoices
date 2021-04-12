Rails.application.routes.draw do
  devise_for :users
  root to: "invoices#index"

  resources :users do
    resources :businesses, except: [:index]
  end

  resources :businesses do
    resources :invoices, except: [:index]
  end

end
