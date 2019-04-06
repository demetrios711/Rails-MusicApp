Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  resources :users, only: [:new, :show, :create]
  resources :bands, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
    resources :albums, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
  resource :session, only: [:create, :destroy, :new]
  
end
