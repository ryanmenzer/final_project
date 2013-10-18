class Transaction < ActiveRecord::Base

   belongs_to :tenant
   belongs_to :sponsorship
   belongs_to :transaction_type

end
