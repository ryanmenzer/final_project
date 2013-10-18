class Story < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  belongs_to :author, class_name: "User"
  belongs_to :storyable, polymorphic: true
  has_many :images, as: :imageable

end
