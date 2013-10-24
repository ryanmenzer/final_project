class SponsorshipsController < ApplicationController
  filter_access_to :all
  def index
    @sponsorships = Sponsorship.paginate(page: params[:page])
  end

  def show
    @sponsorship = Sponsorship.find(params[:id])
    if session[:paypal_payment_id]
      @paypal_payment = PaypalPayment.find(session[:paypal_payment_id])
    end
  end

  def new

  end

end
