# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/username'
  get 'user/password_digest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home'
  get '/sign_up', to: 'user#new'
  post'/users', to: 'user#create'
  get'/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  get '/users', to: 'user#index'
  get '/play', to: 'game#index'
end
