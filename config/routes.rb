Rails.application.routes.draw do
  namespace :admin do
    resources :articles do
      collection do
        get "bad_words", to: "articles#bad_words"
      end
    end
    resources :videos
  end

  resources :articles, only: [:index]
  resources :videos, only: [:index]
  resources :movies  # This will automatically provide the `index` and `show` actions for movies

  get "up" => "rails/health#show", as: :rails_health_check
  get "bad_words", to: "profanity#bad_words"
  get "/movies/:title", to: "movies#show"  # Routes for show by title, if necessary

  root "movies#index"
end
