Rails.application.routes.draw do
  resources :reviews
  resources :project_specialties
  resources :artist_specialties
  resources :specialties
  resources :project_artists
  resources :projects
  resources :creators
  resources :artists, only: [:new, :create, :show, :index, :edit, :update, :destroy] 
  
  get "/sessions/new", to: 'sessions#new', as: 'new_creator_login'
  post '/sessions/creator_login', to: 'sessions#creator_login', as: 'creator_login'
  get "/sessions/logout", to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
