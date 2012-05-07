Listcity::Application.routes.draw do
  resources :lists, only: [:new, :create, :show] do
    resources :items, only: [:index, :create, :destroy] do
      delete :clear, on: :collection
    end
  end
  root to: 'lists#new'
end
