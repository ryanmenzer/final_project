class Receiver < ActiveRecord::Base

  acts_as_tenant

  # belongs_to :tenant
  belongs_to :initiative
  belongs_to :receiverable, polymorphic: true
  has_and_belongs_to_many :sponsorships

end
