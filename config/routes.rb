Rails.application.routes.draw do
  resources :jobs
  resources :resumes, only: :new
end
