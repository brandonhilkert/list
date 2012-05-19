Listcity::Application.routes.draw do
  resources :lists, only: [:new, :create, :show] do
    resources :items, only: [:index, :create, :destroy]
    delete :clear, on: :member
  end
  root to: 'lists#new'
end
