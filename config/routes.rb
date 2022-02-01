Rails.application.routes.draw do
  resources :reviews
  resources :watch_list_movies #only needed routes
  get 'movies/popular'
  get 'movies/search_by_title'
  get 'movies/search_results'
  get 'movies/search'
  resources :movies
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end