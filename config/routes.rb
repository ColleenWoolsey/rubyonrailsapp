Rails.application.routes.draw do
  root "static_pages#landing_page"
  # get 'static_pages/landing_page'
  # get 'static_pages/privacy_policy' - delete this and go directly to privacy_policy
  get "privacy_policy", to: "static_pages#privacy_policy"
  
  get "rock_paper", to: "static_pages#rock_paper"
   
  get "tic_tac", to: "static_pages#tic_tac"
  
  get "to_do", to: "static_pages#to_do"
  
  get "photo_sharing", to: "static_pages#photo_sharing"
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end