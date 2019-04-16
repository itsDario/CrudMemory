# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/username'
  get 'user/password_digest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home'
  get '/sign_up', to: 'user#new'
  get '/users', to: 'user#index'
end
