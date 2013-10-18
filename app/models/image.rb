class Image < ActiveRecord::Base

 belongs_to :tenant
 belongs_to :imageable, polymorphic: true

end
