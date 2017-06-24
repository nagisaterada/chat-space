Rails.application.routes.draw do
  root to: "messages#index"
  devise_for :users
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create] do
    end
  end

end
