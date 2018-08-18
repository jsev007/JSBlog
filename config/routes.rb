Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  
  resources :users, except: [:new]
  get 'signup', to: 'users#new'

  resources :articles
  resources :categories, except: [:destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
