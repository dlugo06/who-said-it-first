Rails.application.routes.draw do
  root 'genius#auth_page'
  resources :searches
  post '/', to: 'genius#authorize'
  get '/oauth2/callback', to: 'genius#show'
end
