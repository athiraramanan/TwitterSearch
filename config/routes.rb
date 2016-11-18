Rails.application.routes.draw do
 
  root 'dash_board#index'
  get 'dash_board/index'
  resources :searches
  resources :users
  
end
