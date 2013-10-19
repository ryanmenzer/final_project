class Story < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :author_id,
                  :title,
                  :content,
                  :storyable_id,
                  :storyable_type

  belongs_to :author, class_name: "Person"
  belongs_to :storyable, polymorphic: true

  has_many :images, as: :imageable

end
