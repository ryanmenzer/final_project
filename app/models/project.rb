require 'searchable'

class Project < ActiveRecord::Base

  acts_as_tenant

  include Searchable

  after_create do
    make_searchable :name
  end

  before_destroy do
    destroy_search
  end

  before_update do
    update_search :name
  end

  attr_accessible :manager_id,
                  :name,
                  :algolia_id

  belongs_to :manager, class_name: "Person"

  has_many   :stories
  has_many   :receivers, as: :receiverable
  has_many   :images,    as: :imageable
  has_many   :stories,   as: :storyable

  has_many   :initiatives, through: :receivers

  def in_initiative?(initiative)
    self.initiatives.include?(initiative)
  end

end
