class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_tenant!   # authenticate user and setup tenant
  before_filter :authenticate_user!
  before_filter :set_current_tenant

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # ------------------------------------------------------------------------------
  # authenticate_tenant! -- authorization & tenant setup
  # -- authenticates user
  # -- sets current tenant
  # -- sets up app environment for this user
  # ------------------------------------------------------------------------------
  def authenticate_tenant!()

    unless authenticate_user!
      email = ( params.nil? || params[:user].nil?  ?  ""  : " as: " + params[:user][:email] )

      flash[:notice] = "cannot sign you in#{email}; check email/password and try again"

      return false  # abort the before_filter chain
    end

    # user_signed_in? == true also means current_user returns valid user
    raise SecurityError,"*** invalid sign-in  ***" unless user_signed_in?

    set_current_tenant   # relies on current_user being non-nil

    # any application-specific environment set up goes here

    true  # allows before filter chain to continue
  end

  def klass_option_obj(klass, option_obj)
    return option_obj if option_obj.instance_of?(klass)
    option_obj ||= {}  # if nil, makes it empty hash
    return klass.send( :new, option_obj )
  end

  # ------------------------------------------------------------------------------
  # prep_signup_view -- prepares for the signup view
  # args:
  #   tenant: either existing tenant obj or params for tenant
  #   user:   either existing user obj or params for user
  # ------------------------------------------------------------------------------
  def prep_signup_view(tenant=nil, user=nil, coupon='')
    @user   = klass_option_obj( User, user )
    @tenant = klass_option_obj( Tenant, tenant )
    # @coupon = coupon
    # @eula   = Eula.get_latest.first
 end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :username
  # end


end
