Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  get '/games/:character', to: 'games#show'
  get '/games/:character/questions_and_answers/:index/points/:points/time/:timestamp', to: 'questions_and_answers#show'
  post '/games/:character/questions_and_answers/:index/points/:points/time/:timestamp', to: 'questions_and_answers#create'
  get '/users/:points/time/:timestamp', to: 'users#show'
end
