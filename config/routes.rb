Rails.application.routes.draw do
  devise_for :users
  root to: "invoices#index"
  resources :invoices, except: [:index]
end
