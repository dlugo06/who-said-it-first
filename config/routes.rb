Rails.application.routes.draw do
  root 'welcome#landing'
  resources :searches
  post '/genius_auth', to: 'genius#authorize'
  get 'genius_auth', to: 'genius#auth_page'
  get '/oauth2/callback.json', to: 'genius#show'

  get 'musix_search', to: 'musixmatches#search'
  post 'musix_search', to: 'musixmatches#results'
  get 'musix_results', to: 'musixmatches#order_results'
end
