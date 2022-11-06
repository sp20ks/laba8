# frozen_string_literal: true

Rails.application.routes.draw do
  get '/elements', to: 'elements#index'
  root 'elements#index'

  get '/elements/result', to: 'elements#result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
