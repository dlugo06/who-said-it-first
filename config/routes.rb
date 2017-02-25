Rails.application.routes.draw do
  root 'welcome#landing'
  resources :searches
  get 'genius_auth', to: 'genius#auth_page'
  post '/', to: 'genius#authorize'
  get '/oauth2/callback.json', to: 'genius#show'
end
