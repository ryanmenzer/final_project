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
  belongs_to :logo, class_name: "Image"

  has_one    :paypal_setting
  has_one    :mandrill_setting

  def avatar
    if self.logo_id
      self.logo.url.avatar
    else
      ActionController::Base.helpers.image_path("avatar-placeholder.jpg")
    end
  end

end
