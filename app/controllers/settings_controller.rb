class SettingsController < ApplicationController

  filter_access_to :all

  def index
    @settings = Setting.find_or_create_by_tenant_id(Tenant.current_tenant.id)
    @paypal = PaypalSetting.find_or_create_by_tenant_id(Tenant.current_tenant.id)
    @mandrill = MandrillSetting.find_or_create_by_tenant_id(Tenant.current_tenant.id)
    @header = {title: current_tenant.setting.display_name,
               subtitle: "Main settings",
               icon: "icon-cogs" }
  end

  def show

  end

  def edit
  end

  def update
    s = Setting.find_by_tenant_id(Tenant.current_tenant.id)
    if s.update_attributes(params[:setting])
      flash[:success] = "Your settings were updated successfylly!"
      redirect_to :back and return
    end
      flash[:error] = "Something went wrong. Your settings have not been saved."
      redirect_to :back and return
  end

end
