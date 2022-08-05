Rails.application.routes.draw do
  root "projects#index"
  
  resources :projects do
    resources :tasks
    post '/tasks/:id/complete', to: 'tasks#complete'
  end
end
