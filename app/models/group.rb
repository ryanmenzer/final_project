class Group < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  mas_many   :users
  belongs_to :manager, class_name: 'User'

end
