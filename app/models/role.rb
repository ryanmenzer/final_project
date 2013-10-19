class Role < ActiveRecord::Base

  acts_as_universal

  has_many   :users

end
