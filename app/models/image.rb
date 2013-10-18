class Image < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  belongs_to :imageable, polymorphic: true

end
