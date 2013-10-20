class Setting < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :tenant_id,
                  :display_name,
                  :logo_id,
                  :cat_1_name,
                  :cat_2_name,
                  :cat_3_name,
                  :email,
                  :paypal_setting_id,
                  :mandrill_setting_id,
                  :primary_contact_id

  belongs_to :tenant
  belongs_to :primary_contact

  has_one    :paypal_setting
  has_one    :mandrill_setting

end
