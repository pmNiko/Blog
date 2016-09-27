Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :articles
  root "articles#index"

  get '/profile/edit', to:'profiles#edit',
      as: 'edit_profile'
  patch '/profile', to:'profiles#update'
end
