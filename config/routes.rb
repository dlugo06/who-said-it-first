Rails.application.routes.draw do
  root 'welcome#landing'
  resources :searches
  post '/genius_auth', to: 'genius#authorize'
  get 'genius_auth', to: 'genius#auth_page'
  get '/oauth2/callback.json', to: 'genius#show'

  get 'musix_index', to: 'musixmatches#index'
  post 'musix_index', to: 'musixmatches#search'
  get 'musix_show', to: 'musixmatches#show'
end
