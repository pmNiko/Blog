Rails.application.routes.draw do
  root "articles#index"

  get '/articles',
      to: 'articles#index',
      as: 'articles'
  get 'articles/:id',
      to: 'articles#show',
      as: 'article'
  #resource :articles
end
