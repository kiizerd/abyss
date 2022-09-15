Rails.application.routes.draw do
  root "projects#index"
  
  resources :projects do
    resources :tasks
    post '/tasks/:id/complete', to: 'tasks#complete'

    resources :issues
    post '/issues/:id/complete', to: 'issues#complete'
  end
  
  scope '/api/v1' do
    resources :projects
  end
end
