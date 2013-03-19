Checkmate::Application.routes.draw do
  root :to => 'home#index'
  resources :banks, :only => [:new, :create, :destroy]
end
