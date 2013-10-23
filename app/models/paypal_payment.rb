class PaypalPayment < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :payer_id,
                  :sponsorship_id,
                  :paypal_payer_id,
                  :paypal_token,
                  :paypal_recurring_token,
                  :active,
                  :amount

  belongs_to :sponsorship
  belongs_to :payer, class_name: "Person"
  has_many   :transactions


end
