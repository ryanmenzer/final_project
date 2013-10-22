class SettingsController < ApplicationController

  def index
    @settings = Setting.find_or_create_by_tenant_id(current_tenant.id)
    @paypal = PaypalSetting.find_or_create_by_tenant_id(current_tenant.id)
    @mandrill = MandrillSetting.find_or_create_by_tenant_id(current_tenant.id)
    @header = {title: current_tenant.setting.display_name,
               subtitle: "Main settings",
               icon: "icon-cogs" }
  end

end
