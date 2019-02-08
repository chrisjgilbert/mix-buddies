Rails.application.routes.draw do
  root "mixes#index"
  resources :mixes, only: [:index, :new, :create, :destroy]
end
