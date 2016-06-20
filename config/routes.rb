Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, except: [:new, :edit], defaults: { format: 'json' }
        resources :products, except: [:new, :edit], defaults: { format: 'json' }
        resources :courses, except: [:new, :edit], defaults: { format: 'json'} 
      end
    end
end
