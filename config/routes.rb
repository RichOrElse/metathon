Rails.application.routes.draw do
  resources :ideas
  devise_for :hackers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "hackathons#index"
  resources :hackathons
end
