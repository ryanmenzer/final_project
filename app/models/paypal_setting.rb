class TenantPaypalSetting < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :api_username,
                  :api_password,
                  :api_signature

  belongs_to :setting

end
