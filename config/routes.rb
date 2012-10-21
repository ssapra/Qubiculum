Quibiculum::Application.routes.draw do

  resources :answers

  post "thread/new" => 'webs#create', :as => :threads
  delete "thread" => 'webs#destroy', :as => :destroy_thread
  post "vote" => 'answers#vote', :as => :change_value

  devise_for :users
  resources :courses
  resources :sections 
  resources :users
  resources :questions
  
  get "/departments" => 'departments#index', :as => :departments
  get "/department/:department_id" => 'departments#show', :as => :department
  
  root :to => "static_pages#home"
  
end
