class SettingsController < ApplicationController

  def index
    @settings = current_tenant.setting
  end

end
