Checkmate::Application.routes.draw do
  root :to => 'home#index'
  resources :banks do
    member do
      get :deposit_info
      get :deposit_chart
      get :withdrawal_info
      get :withdrawal_chart
    end
  end
  resources :transactions
end
