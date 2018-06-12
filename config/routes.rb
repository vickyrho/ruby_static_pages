
RailsProject::Application.routes.draw do
  get 'users/new'
  #get 'users/new'
  root to: 'static_pages#home'
  #match '/', to: 'static_pages#home',:via => [:get]
  match '/signup',  to: 'users#new', :via =>[:get]
  match '/help',    to: 'static_pages#help' ,:via => [:get]
  match '/about',   to: 'static_pages#about',:via => [:get]
  match '/contact', to: 'static_pages#contact',:via => [:get]
end