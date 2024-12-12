Rails.application.routes.draw do
  get "movies/index"
  namespace :admin do
    resources :articles do
      collection do
        get "bad_words", to: "articles#bad_words"
      end
    end
    resources :videos
  end


  resources :articles, only: [ :index ]
  resources :videos, only: [ :index ]
  resources :movies

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "bad_words", to: "profanity#bad_words"
  get "/movies/:title", to: "movies#show"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "movies#index"
end
