class Image < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :title,
                  :url,
                  :creator_id,
                  :imageable_id,
                  :imageable_type

  belongs_to :imageable, polymorphic: true

  # mount_uploader :image, ImageUploader

end
