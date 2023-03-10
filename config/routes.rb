Rails.application.routes.draw do

  resources :users, except:[:new]
  resources :articles

  root 'pages#home'
  get "about", to: "pages#about"
  get 'signup', to: 'users#new'
  get 'login', to: "session#new"
  post 'login',to: "session#create"
  get 'logout', to: 'session#destroy'
  resources :categories, except: [:destroy]

end
