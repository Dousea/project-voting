# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config

  get '/profile', to: 'users#show'
  get '/vote', to: 'candidates#index'
  get '/live', to: 'candidates#live'
  get '/candidates/:number', to: 'candidates#show', as: 'candidate'
  post '/candidates/:number/vote', to: 'candidates#vote', as: 'vote_candidate'

  root to: redirect('/profile')
end
