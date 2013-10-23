class Tenant < ActiveRecord::Base

  # include SearchableTenant

  acts_as_universal_and_determines_tenant

  has_one :setting





  def self.create_new_tenant(org_name)
    return Tenant.create(org_name: org_name)
  end

  def self.tenant_signup(user, tenant, other = nil)
    # do any needed tenant initial setup
  end

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
