Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match '/movies/:id/similar', to: 'movies#find_same_director', as: 'search_same_director', via: :get
end
