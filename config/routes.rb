Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
	resources :groups, only: %(index new create edit update) do
		resources :messages, only: %i(index create)
	end
end
