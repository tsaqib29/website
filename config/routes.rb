Rails.application.routes.draw do
  get '/search', to: "book#search"
  resources :paginations
  get 'password_resets/new'
  get 'kategori/index'
  get 'book/index'
  get '/index' => 'home#index'
  get '/book' => 'book#index'
  get '/service' => 'home#service'
  get '/about' => 'home#about'
  get '/profile' => 'home#profile'
  get '/' => 'home#index'
  get '/book/detail/:id' => 'book#detail'
  get '/book/new' => 'book#new'
  get '/category/list' => 'category#list'
  get '/category/edit/:id' => 'category#edit'
  post '/category/update/:id' => 'category#update'
  delete '/categories/:id' => 'category#destroy'
  get '/category/new' => 'category#new'
  post '/categories/create' => 'category#create'
  post '/book/create' => 'book#create'
  get '/book/edit/:id' => 'book#edit'
  post '/book/update/:id' => 'book#update'
  get '/book/hapus/:id' => 'book#hapus'
  
  root :to => "home#index"
  resources :users
  
  resources :password_resets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/home", to: "home#index"
# ----------------------------------------------------------------

  # halaman utama
  root to: 'home#index', as: 'home_index'

  # register
  get '/daftar', to: 'auth#form_register', as: 'form_register'
  post '/daftar', to: 'auth#register', as: 'register_post'

  # login
  get '/login', to: 'auth#form_login', as: 'form_login'
  post '/login', to: 'auth#login', as: 'login_post'

  # logout
  get '/logout', to: 'auth#logout', as: 'user_logout'
end