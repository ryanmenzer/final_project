class Role < ActiveRecord::Base

 belongs_to :tenant
 has_many   :users

end
