Rails.application.routes.draw do
  get '/recipes' => 'recipes#index'
  get '/recipes/:id' => 'recipes#show'
  post '/recipes' => 'recipes#create'
  put '/recipes/:id' => 'recipes#update'
  delete '/recipes/:id' => 'recipes#destroy'
end
