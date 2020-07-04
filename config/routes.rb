Rails.application.routes.draw do
  root :to => 'static#index'
  
  # Shopify Engine
  mount ShopifyApp::Engine, at: '/shopify-install'
  ### Shopify Charge Callbacks
  get '/callback' => 'home#recurring_charge_callback'
  get '/cancel'   => 'home#destroy'

  # Rails Admin Engine
  mount RailsAdmin::Engine => '/ts_admin', as: 'rails_admin'

  controller :mandatory_webhooks do
    post '/webhooks/shop_redact' => :shop_redact
    post '/webhooks/customers_redact' => :customers_redact
    post '/webhooks/customers_data_request' => :customers_data_request
  end

  get '/admin', to: 'home#index'
end
