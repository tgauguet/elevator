Rails.application.routes.draw do
  root "elevator#show"
  resources :elevators do
    resources :calls
  end
end
