class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_shop
    if @current_shopify_session
      @shop = Shop.find_by(shopify_domain: @current_shopify_session.domain)
    else
      @shop = Shop.find_by(uuid: params[:uuid])
    end
  end
end
