Rails.application.routes.draw do
  root to: 'pages#home'

  get :linkedin, to: 'pages#linkedin'

  resources :jobs
  resources :educations

  resources :resumes, only: [:new, :edit, :show, :update]
  resources :experiences, only: :index
end
