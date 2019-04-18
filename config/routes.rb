# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user/username'
  get 'user/password_digest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home'
  get '/sign_up', to: 'user#new'
  post'/sign_up', to: 'user#create'
  get '/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  get '/users', to: 'user#index'
  get '/learn', to: 'game#display_grid'
  get '/recall', to: 'game#input_grid'
  post '/recall_submit', to: 'game#recall_submit'
  get '/loseScreen', to: 'game#lose_screen'
  get '/profile', to: 'user#show'
  get '/edit', to: 'user#edit'
  get '/leaderboard', to: 'leaderboard#index'
  post '/play', to: 'game#create'
  get '/newgame', to: 'game#new'
  get '/logout', to: 'sessions#destroy'
  post'/edit', to: 'user#update'
end
