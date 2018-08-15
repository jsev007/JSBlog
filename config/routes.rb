Rails.application.routes.draw do
  
  resources :users, except: [:new]
  resources :articles
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
