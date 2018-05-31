Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root 'home#index'
  # resources :reviews
  get '/:movie_id/reviews/new' => "reviews#new", as: :new_review
  get '/:movie_id/reviews' => "reviews#movie_reviews", as: :movie_reviews
  post '/:movie_id/reviews' => "reviews#create", as: :create_review
  get '/reviews' => "reviews#index", as: :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
