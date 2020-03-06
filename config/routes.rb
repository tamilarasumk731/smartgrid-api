Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :orders, only: [] do
    collection do
      put '/pickedup', to: "orders#order_picked_up"
      post '/create', to: "orders#create"
      get '/show', to: "orders#show"
    end
  end

  resources :products, only: [:index] do
    collection do
      get '/search',   to: "products#search"
    end
  end

  resources :user_links, only: [:index] do
    collection do
      put '/create', to: "user_links#create"
      post '/post_updates', to: "user_links#post_user_data"
      get '/get_updates', to: "user_links#get_user_data"
      post '/analyse_data', to: "user_links#analyse_data"
      post '/update', to: "user_links#update_user_data"
    end
  end

end
