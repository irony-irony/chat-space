Rails.application.routes.draw do
  root 'messaages#index'
resources :messages, only: [:index]
end
