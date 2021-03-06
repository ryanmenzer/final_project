class Sponsorship < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :frequency_id,
                  :initiative_id,
                  :recurring_payment,
                  :amount,
                  :active,
                  :start_date,
                  :end_date

  belongs_to :frequency
  belongs_to :initiative

  has_and_belongs_to_many :sponsors, class_name: "Person"
  has_and_belongs_to_many :receivers

  has_many :transactions
  has_many :paypal_payments

end
