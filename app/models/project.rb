class Project < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :manager_id,
                  :name

  belongs_to :manager, class_name: "Person"

  has_many   :stories
  has_many   :receivers, as: :receiverable
  has_many   :images,    as: :imageable
  has_many   :stories,   as: :storyable

end
