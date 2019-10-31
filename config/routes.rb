Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/login' => redirect("/")


  resources :courses do
    resources :reviews
  end
  
  resources :users
  

end
