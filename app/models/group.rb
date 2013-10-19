class Group < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :name,
                  :manager_id

  has_many   :people
  belongs_to :manager, class_name: 'Person'

end
