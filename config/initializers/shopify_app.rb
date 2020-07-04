ShopifyApp.configure do |config|
  config.application_name = ENV['the_shop_name']
  config.api_key = ENV['shopify_api_key']
  config.secret = ENV['shopify_api_secret']
  config.scope = ENV['shopify_access_scopes']
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = '2019-04'
  config.shop_session_repository = 'Shop'
  config.root_url = '/shopify-install'
  config.webhooks = [
    {topic: 'app/uninstalled', address: 'https://www.theshopcalendar.com/shopify-install/webhooks/app_uninstalled'}
  ]
end