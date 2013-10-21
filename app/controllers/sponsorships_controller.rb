class SponsorshipsController < ApplicationController

  def index
    @sponsorships = Sponsorship.paginate(page: params[:page])
  end

  def show
    @sponsorship = Sponsorship.find(params[:id])
  end

  def new 
  
  end 

end
