class Receiver < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :initiative_id,
                  :receiverable,
                  :receiverable_id,
                  :receiverable_type

  belongs_to :initiative
  belongs_to :receiverable, polymorphic: true

  has_and_belongs_to_many :sponsorships

end
