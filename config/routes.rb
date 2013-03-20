Checkmate::Application.routes.draw do
  root :to => 'home#index'
  resources :banks, :only => [:new, :create, :show, :destroy] do
    collection do
      get :transfer
      post :transfer_amt
    end
  end
end
