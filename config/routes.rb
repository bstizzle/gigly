Rails.application.routes.draw do
  resources :artist_specialities
  resources :specialities
  resources :project_artists
  resources :projects
  resources :creators
  resources :artists, only: [:new, :create, :show, :index, :edit, :update, :destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
