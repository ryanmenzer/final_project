class Project < ActiveRecord::Base

  belongs_to :tenant
  belongs_to :manager, class_name: "User"
  has_many   :stories
  has_many   :receivers, as: :receiverable
  has_many   :images,    as: :imageable
  has_many   :stories,   as: :storyable

end
