Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    resources :website_listings, only: [:index, :update]
  end

  resources :static_pages, only: [:show]
end
