Listcity::Application.routes.draw do
  resources :items, only: [:index, :create, :destroy] do
    delete :clear, on: :collection
  end
  root to: 'items#index'
end
