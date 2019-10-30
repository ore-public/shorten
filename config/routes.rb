Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: %i[new create show]

  get '/:slug', to: 'redirects#show'
end
