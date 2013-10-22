class Image < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :title,
                  :url,
                  :creator_id,
                  :imageable_id,
                  :imageable_type

  attr_accessor   :image_for_type, :image_for_id

  has_one :person
  belongs_to :imageable, polymorphic: true

  mount_uploader :url, ImageUploader

end
