class Group < ActiveRecord::Base

 belongs_to :tenant
 mas_many   :users
 belongs_to :manager, class_name: 'User'

end
