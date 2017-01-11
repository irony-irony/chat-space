Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: :search do
    collection do
      get 'search'
    end
  end
  resources :groups, only: %i(index new create edit update) do
    resources :messages, only: %i(index create)
  end
end

