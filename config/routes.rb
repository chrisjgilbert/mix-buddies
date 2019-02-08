Rails.application.routes.draw do
  root "mixes#index"
  resources :mixes
end
