# frozen_string_literal: true
class StaticController < ApplicationController
  layout "marketing"

  def index
    @title = "The Shop Calendar | A mobile responsive calendar for your online store."
    redirect_if_session_found
  end

  def contact
    @title = "Contact Us | The Shop Calendar"
    @description = "We're here to help you with any questions you might have"
  end

  def faq
    @title = "Frequently Asked Questions | The Shop Calendar"
    @description = "The questions you want answered, so we created this page."
  end

  def features
    @title = "Features | The Shop Calendar"
    @description = "Learn more about The Shop Calendar, the calendar widget built specifically for Shopify stores"
  end

  def examples
    @title = "Examples | The Shop Calendar"
    @description = "View examples of The Store Calendar widget and how it can be used in your store"
  end

  def pricing
    @title = "Pricing | The Shop Calendar"
    @description = "A simple app with simple pricing. The Shop Calendar is $5 /month charged to your Shopify bill"
  end

  def privacy
    @title = "Privacy | The Shop Calendar"
    @description = "Privacy Policy"
  end

  def terms
    @title = "Terms | The Shop Calendar"
    @description = "Terms and Conditions"
  end

  private

  def redirect_if_session_found
    if params[:session] || params[:hmac] || @current_shopify_session
      redirect_to admin_url
    end
  end
end
