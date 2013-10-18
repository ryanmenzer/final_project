class Frequency < ActiveRecord::Base

 belongs_to :tenant
 has_many   :sponsorships

end
