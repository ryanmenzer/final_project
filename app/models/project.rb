require 'searchable'

class Project < ActiveRecord::Base

  acts_as_tenant

  include Searchable

  after_save do
    make_searchable :name
  end

  attr_accessible :manager_id,
                  :name

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
