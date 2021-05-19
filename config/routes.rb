Rails.application.routes.draw do
  root "shifts#new"
  resources :posts, only: [:index]
  resources :shifts, only: [:new, :create]
end
