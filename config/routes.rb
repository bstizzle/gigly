Rails.application.routes.draw do
  resources :artist_specialities
  resources :specialities
  resources :project_artists, only: [:new, :create]
  resources :projects
  resources :creators
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
