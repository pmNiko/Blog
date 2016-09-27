Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :articles
  root "articles#index"

  devise_for :users,
    :controllers => { registrations: 'registrations'}

end
