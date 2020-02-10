Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
