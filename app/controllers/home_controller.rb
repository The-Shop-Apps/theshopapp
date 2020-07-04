# frozen_string_literal: true
require 'open-uri'

class HomeController < AuthenticatedController
  before_action :get_shop
  before_action :load_current_recurring_charge

  def index
    if !@shop.subscribed
      @recurring_application_charge.try!(:cancel)

      @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.new(
        name: "The Shop Calendar Basic",
        price: 5.00,
        trial_days: 7,
        return_url: callback_url, # def recurring_charge_callback
        test: Rails.env.development? || nil
      )

      if @recurring_application_charge.save
        redirect_to @recurring_application_charge.confirmation_url
      else
        flash[:danger] = @recurring_application_charge.errors.full_messages.first.to_s.capitalize
        redirect_to admin_url
      end
    end
  end

  def recurring_charge_callback
    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.find(params[:charge_id])
    if @recurring_application_charge.status == 'accepted'
      @recurring_application_charge.activate
      @shop.update(subscribed: true)
    else
      @shop.update(subscribed: nil)
    end

    redirect_to admin_url
  end
  
  def destroy
    # Cancelling recurring application charge
    @recurring_application_charge.cancel
    # Unsubscribe store from the application
    @shop.update(subscribed: false, account_type: nil)
    flash[:success] = "Your subscription to this application has been cancelled successfully and you will no longer be charged."
    redirect_to admin_url
  end

  private

  def load_current_recurring_charge
    @recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.current
  end
end