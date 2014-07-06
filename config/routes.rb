Rails.application.routes.draw do
  root to: 'pages#home'

  resources :jobs
  resources :educations

  resources :resumes, only: :new
end
