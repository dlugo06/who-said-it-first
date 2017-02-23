Rails.application.routes.draw do
  resources :searches
  root 'searches#new'
  get '/oauth2/callback', to: 'results#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
