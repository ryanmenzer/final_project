class Initiative < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :manager_id,
                  :title,
                  :description,
                  :goal,
                  :active,
                  :start_date,
                  :end_date

  belongs_to :manager, class_name: "Person"
  has_many   :sponsorships
  has_many   :receivers
  has_many   :stories
  has_many   :images, as: :imageable
  has_many   :stories, as: :storyable

end
