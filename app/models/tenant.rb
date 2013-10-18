class Tenant < ActiveRecord::Base

  acts_as_universal_and_determines_tenant

  # has_and_belongs_to_many :users
  # belongs_to              :primary_contact, class_name: "User"

  def self.create_new_tenant(params)

    tenant = Tenant.new(:org_name => params[:tenant][:org_name])

    if new_signups_not_permitted?(params)

      raise ::Milia::Control::MaxTenantExceeded, "Sorry, new accounts not permitted at this time"

    else
      tenant.save!    # create the tenant
    end
    return tenant
  end


end
