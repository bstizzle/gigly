Rails.application.routes.draw do
  resources :artist_specialties
  resources :specialties
  resources :project_artists, only: [:new, :create]
  resources :projects
  resources :creators
  resources :artists, only: [:new, :create, :show, :index, :edit, :update, :destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
