# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/profile', to: 'users#show'
  get '/vote', to: 'candidates#index'
  get '/candidates/:number', to: 'candidates#show', as: 'candidate'

  root to: redirect('/profile')
end
