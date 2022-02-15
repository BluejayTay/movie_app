# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews, except: [:show]
  resources :watch_list_movies, except: [:edit]
  get 'movies/popular'
  get 'movies/search_by_title'
  get 'movies/search_results'
  get 'movies/search'
  get 'movies/top_rated'
  resources :movies
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
