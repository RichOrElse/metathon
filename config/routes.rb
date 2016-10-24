Rails.application.routes.draw do
  resources :ideas do
    resources :hackathon, only: [:update, :destroy], controller: :entry
    member do
      post :join
      delete :leave
    end
  end

  resources :hackathons do
    member do
      post :join
      delete :leave
    end
  end

  devise_for :hackers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "hackathons#index"
end
