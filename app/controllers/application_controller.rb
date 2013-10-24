  class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :check_subdomain, :if => Proc.new{Rails.env.production?}
  before_filter :authenticate_tenant!   # authenticate user and setup tenant
  before_filter :authenticate_user!
  before_filter :set_current_tenant
  before_filter :set_locale
  before_filter { |c| Authorization.current_user = c.current_user }

def after_sign_in_path_for(resource)
  dashboard_path
end

  def check_subdomain
    if !Tenant.find_by_subdomain(request.subdomain)
      redirect_to root_url(:host => request.domain)
    end
  end

  def current_tenant
    Tenant.current_tenant
  end

  def email_story(storycomplete)
    require 'mandrill'
    @story = storycomplete
    email_array = [{:email=> "eigil@sagafos.no",:name=> "Eigil Sagafos"},
                   {:email=> "titipongpisit2013@gmail.com",:name=> "Tee Thai"}]

    mandrill_api = Mandrill::API.new
    message = {subject: @story.title,
               from_name: current_tenant.setting.display_name,
               text: @story.content,
               to: email_array,
               #html: "<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",
               from_email: current_tenant.setting.default_email }
     send = mandrill_api.messages.send message
     puts send
  end


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

  private

  def current_tenant_by_subdomain
    Tenant.find_by_subdomain! request.subdomain
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
