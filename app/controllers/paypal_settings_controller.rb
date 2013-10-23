class PaypalSettingsController < ApplicationController

  filter_access_to :all

  def update
    m = PaypalSetting.find(params[:id])
    if m.update_attributes(params[:paypal_setting])
      flash[:success] = "Your paypal settings were updated successfylly!"
      redirect_to :back and return
    end
      flash[:error] = "Something went wrong. Your settings have not been saved."
      redirect_to :back and return
  end


end
