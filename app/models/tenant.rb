class Tenant < ActiveRecord::Base

  #acts_as_universal_and_determines_tenant

  has_and_belongs_to_many :users
  belongs_to             :primary_contact, class_name: "User"

end
