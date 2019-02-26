# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  resources :mixes
end
