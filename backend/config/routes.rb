Rails.application.routes.draw do
  resources :users do
    resources :events
  end

  # get '/events', :to => 'events#get_events'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
