Rails.application.routes.draw do
  post '/auth_page', to: 'searches#authorize'
  resources :searches
  root 'searches#auth_page'
  get '/oauth2/callback', to: 'results#show'
end
