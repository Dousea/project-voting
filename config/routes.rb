# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/profile', to: 'users#show'
  get '/vote', to: 'voting#index'

  root to: redirect('/profile')
end
