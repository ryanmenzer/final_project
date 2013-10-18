class TransactionType < ActiveRecord::Base

   belongs_to :tenant
   has_many   :transactions

end
