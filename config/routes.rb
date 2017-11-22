# frozen_string_literal: true

Rails.application.routes.draw do
  resources :stories
  resources :photos
  resources :vacations
  resources :examples
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: %i[index show]
end
