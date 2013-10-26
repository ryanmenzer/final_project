require 'searchable'

class Group < ActiveRecord::Base

  acts_as_tenant

  include Searchable

  after_create do
    make_searchable :name, :email
  end

  before_destroy do
    destroy_search
  end

  before_update do
    update_search :name, :email
  end

  attr_accessible :name,
                  :manager_id,
                  :algolia_id

  has_and_belongs_to_many :members, class_name: 'Person'
  belongs_to :manager, class_name: 'Person'

end
