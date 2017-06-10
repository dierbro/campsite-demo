Rails.application.routes.draw do
  resources :campsites, only: [] do
    resources :activities, only: [:index] do
      resources :children, only: [:index, :update], shallow: true
    end
  end
end
