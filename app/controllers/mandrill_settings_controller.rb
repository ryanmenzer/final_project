class MandrillSettingsController < ApplicationController

  filter_access_to :all

  def update
    m = MandrillSetting.find(params[:id])
    if m.update_attributes(params[:mandrill_setting])
      flash[:success] = "Your mandrill settings were updated successfylly!"
      redirect_to :back and return
    end
      flash[:error] = "Something went wrong. Your settings have not been saved."
      redirect_to :back and return
  end


end
