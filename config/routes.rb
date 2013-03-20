Checkmate::Application.routes.draw do
  root :to => 'home#index'
  resources :banks, :only => [:new, :create, :show, :destroy] do
    collection do
      put :transfer
    end
  end
end
