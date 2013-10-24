class Group < ActiveRecord::Base

  acts_as_tenant

  include Searchable

  after_save do
    make_searchable :name
  end

  attr_accessible :name,
                  :manager_id

  has_and_belongs_to_many :members, class_name: 'Person'
  belongs_to :manager, class_name: 'Person'

end
