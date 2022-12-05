Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      namespace :admin do
        jsonapi_resources :actors, only: %i[index show update create]
        jsonapi_resources :movies, only: %i[index show update create]
      end
      jsonapi_resources :users, only: %i[index show update] do
        collection do
          post :login, :register
          delete :logout
        end
      end
      jsonapi_resources :actors, only: %i[index show]
      jsonapi_resources :movies, only: %i[index show] do
        collection do
          get :casts
        end
      end
    end
  end
end
