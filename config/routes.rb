Rails.application.routes.draw do

  devise_for :users,
               :path => '', 
               :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}
  
  
  root 'pages#home'
  
  resources :users, only: [:show]
  resources :formulaires do
    resources :polls 
    member do
    get 'duplicate'
    end
  end
  resources :questions
  resources :answers, only: [:destroy]
  resources :photos

end
