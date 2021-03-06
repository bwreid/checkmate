Checkmate::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :only => [:new, :create]
  root :to => 'home#index'
  resources :banks, :only => [:new, :create, :show, :destroy] do
    collection do
      get :transfer
      post :transfer_amt
    end
    member do
      get :deposit_info
      get :deposit_chart
      get :withdrawal_info
      get :withdrawal_chart
    end
  end
  resources :transactions
end