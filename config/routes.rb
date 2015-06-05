Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index ]
  root :to => "posts#index"
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/post', to: 'posts#new',     via: 'get'
  

end
