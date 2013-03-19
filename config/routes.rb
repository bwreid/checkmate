Checkmate::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :only => [:new, :create]
  root :to => 'home#index'
  resources :banks, :only => [:new, :create, :destroy]
end
