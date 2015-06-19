Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :show, :update, :destroy, :create], defaults: { format: 'json' }
        resources :products, only: [:index, :show, :update, :destroy, :create], defaults: { format: 'json' }
      end
    end
end
