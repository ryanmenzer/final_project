class Role < ActiveRecord::Base

  acts_as_universal

  # belongs_to :tenant
  has_many   :users

end
