class Image < ActiveRecord::Base

	attr_accessible :something, #column name where image goes
								:remote_image_url 

  acts_as_tenant

  # belongs_to :tenant
  belongs_to :imageable, polymorphic: true

  mount_uploader :image, ImageUploader

end
