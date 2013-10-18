class TransactionType < ActiveRecord::Base

  acts_as_universal
  belongs_to  :tenant

  # belongs_to :tenant
  has_many   :transactions

end
