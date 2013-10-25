class HomesController < ApplicationController


  skip_before_filter :check_subdomain, :only => [ :home, :oliwi  ]
  skip_before_filter :authenticate_tenant!, :only => [ :index,:oliwi, :home ]
  skip_before_filter :authenticate_user!, :only => [ :index, :oliwi, :home ]
  filter_access_to :all

  def index
    @initiative = Initiative.order("updated_at DESC").limit(1).first
    @initiatives = Initiative.order("updated_at DESC").limit(2)
    @sums = @initiatives.map {|i| i.transactions.sum('amount')}
    @stories = Story.limit(10)
    @images = Image.limit(10)
    @people = Person.all
  end

  def home
    if @tenant = Tenant.find_by_subdomain(request.subdomain)
      if user_signed_in?
        redirect_to :dashboard
      else
        Tenant.set_current_tenant @tenant.id
        redirect_to :new_user_session
      end
    else
      session.clear
      redirect_to root_url(:host => request.domain)
    end
  end

  def oliwi

  end

end
