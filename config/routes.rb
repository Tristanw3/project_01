Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/view' => 'users#view'

  get '/' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/login' => redirect("/")

  # get '/add_course' => 'courses#new'
  # post '/add_course' => 'courses#create'
  resources :courses

end
