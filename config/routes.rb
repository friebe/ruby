Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root    'logins#new',   to: 'logins#new'

  get    '/login',   to: 'logins#new'
  post   '/login',   to: 'logins#create'
  delete '/logout',  to: 'logins#destroy'

  resources :projects do
    resources :comments
  end

  resources :users

end
