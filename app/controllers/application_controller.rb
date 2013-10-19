  class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_tenant!   # authenticate user and setup tenant
  before_filter :authenticate_user!
  before_filter :set_current_tenant

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :set_locale

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  def set_locale
    I18n.locale=params[:locale]
  end
  # def set_locale
  # locale = params[:locale] || session[:locale] || I18n.default_locale.to_s
  # locale = I18n.available_locales.include?(locale.to_sym) ? locale : 18n.default_locale.to_s
  # session[:locale] = I18n.locale = locale
  # end

  # Sets locale dependent on: user logged in with locale / locale stored in session / otherwise use default
  # def set_locale
  #   I18n.locale = (current_user.locale if current_user) || session[:locale] || I18n.default_locale
  # end

  #Automatically include locale for routes/resource routes in URL query string
  def default_url_options(options={})
    { :locale => I18n.locale }
  end

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
 end


  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :username
  #

  helper_method :all_users

  def all_users
    @users ||= Tenant.current_tenant.users.all
  end

end
