Rails.application.routes.draw do
  get '/pokemon/:id', to: 'pokemon#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
