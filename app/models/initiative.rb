class Initiative < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  has_many   :sponsorships
  has_many   :receivers
  has_many   :stories
  has_many   :images, as: :imageable
  has_many   :stories, as: :storyable

end
