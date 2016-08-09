Rails.application.routes.draw do
  root "articles#index"

  get '/articles',
      to: 'articles#index',
      as: 'articles'
  post '/articles',
      to: 'articles#create'
  get '/articles/new',
      to: 'articles#new',
      as: 'new_article'
  get 'articles/:id',
      to: 'articles#show',
      as: 'article'
  delete '/articles/:id',
      to: 'articles#destroy'
  #resource :articles
end
