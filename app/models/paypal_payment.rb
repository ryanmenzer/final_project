class PaypalPayment < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :payer_id,
                  :sponsorship_id,
                  :paypal_payer_id,
                  :paypal_token,
                  :paypal_recurring_token,
                  :active

  belongs_to :sponsorship
  belongs_to :payer, class_name: "Person"
  has_many   :transactions



  # def initialize(subscription)
  #   @subscription = subscription
  # end

  # def checkout_details
  #   PayPal::Recurring.new(token: @subscription.paypal_payment_token).checkout_details
  # end

  # def make_recurring
  #   ppr = PayPal::Recurring.new(
  #     token: @subscription.paypal_payment_token,
  #     payer_id: @subscription.paypal_customer_token,
  #     description: @subscription.payer_id,
  #     amount: @subscription.amount,
  #     currency: "USD"
  #   )

  #   response = ppr.request_payment
  #   if response.errors.present?
  #     raise response.errors.inspect
  #   end

  # end

end
