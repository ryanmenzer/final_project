class Transaction < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  belongs_to :sponsorship
  belongs_to :transaction_type

end
