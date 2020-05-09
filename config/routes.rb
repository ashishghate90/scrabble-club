Rails.application.routes.draw do
  root to: 'members#index'
  resources :members, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
