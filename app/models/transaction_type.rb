class TransactionType < ActiveRecord::Base

  acts_as_universal

  has_many   :transactions

end
