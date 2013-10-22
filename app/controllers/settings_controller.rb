class SettingsController < ApplicationController

  def index
    @settings = current_tenant.setting
    @paypal = PaypalSetting.find_or_create_by_tenant_id(current_tenant.id)
    @mandrill = MandrillSetting.find_or_create_by_tenant_id(current_tenant.id)
    @header = {title: current_tenant.setting.display_name,
               subtitle: "Main settings",
               icon: "icon-cogs" }
  end

end
