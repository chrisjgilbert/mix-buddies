# frozen_string_literal: true

Rails.application.routes.draw do
  root 'mixes#index'
  resources :mixes
end
