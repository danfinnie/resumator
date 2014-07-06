Rails.application.routes.draw do
  root to: 'pages#home'

  resources :jobs
  resources :resumes, only: :new
end
