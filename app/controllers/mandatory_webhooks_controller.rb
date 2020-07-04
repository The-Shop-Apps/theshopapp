class MandatoryWebhooksController < ApplicationController
  include ShopifyApp::WebhookVerification
  
  def shop_redact
    params.permit!
    render :status => "200", :json => {:message => "We have received your request to delete your store data. We will do this ASAP."}.to_json
  end

  def customer_redact
    params.permit!
    render :status => "200", :json => {:message => "We have received your request to delete your user data. We will do this ASAP."}.to_json
  end

  def customer_data_request
    params.permit!
    render :status => "200", :json => {:message => "We have received your request for your customer data. We will provide this to you ASAP via email."}.to_json
  end

  private

  def webhook_params
    params.except(:controller, :action, :type)
  end
end