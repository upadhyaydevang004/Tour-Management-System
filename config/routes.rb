Rails.application.routes.draw do
  resources :reviews
  resources :bookings
  resources :searches
  resources :bookmarks
  resources :tours
  resources :customers
  resources :agents
  resources :admins

  root 'static_page#home'

  get 'bookmarks/potential_buyers/:tour_id', to: 'bookmarks#potential_buyers'
  get 'bookmarks/add/:customer_id/:tour_id', to: 'bookmarks#add'
  get '/bookings/new/:tour_id', to: 'bookings#new'
  get '/bookings/:booking_id/:tour_id', to: 'bookings#destroy'
  get '/reviews/:customer_id/:tour_id', to: 'reviews#new'

  # get '/partial_delete/:booking_id', to: 'bookings#partial_delete'
  # get '/partial_delete/bookings/:booking_id/:seats_booked', to: 'bookings#partial_delete'

  get '/home', to: 'static_page#home'
  get    '/signup',  to: 'sessions#redirect'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
