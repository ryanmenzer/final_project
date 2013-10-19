class MandrillSetting < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :api_email,
                  :api_key

  belongs_to :setting

end
