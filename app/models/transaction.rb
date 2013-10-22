class Transaction < ActiveRecord::Base

  acts_as_tenant
  validates :amount, presence: true
  validates_numericality_of :amount, :greater_than => 1 
  validates :sponsorship_id, presence: true
  validates :payer_id, presence: true


  attr_accessible :transaction_type_id,
                  :sponsorship_id,
                  :payer_id,
                  :date,
                  :amount,
                  :status

  belongs_to :sponsorship
  belongs_to :transaction_type
  belongs_to :payer, class_name: "Person"


end
