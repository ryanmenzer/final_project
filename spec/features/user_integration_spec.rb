require 'support/user_helper'
include Warden::Test::Helpers
Warden.test_mode!
# require 'factory_girl_rails'
describe "LoginToAccounts with valid credentials" do
  before do
    @tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    c = Category.create(name: "Staff")
    r = Role.create(name: "Administrator")
    @user = User.create(email: "hello@example.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @tenant.users << @user
    Capybara.app_host = "http://test-account.example.com"
    visit '/'
    click_link "Sign in here"
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button 'Login'
  end

# describe "LoginToAccounts" do
#   before do
#     other_account = FactoryGirl.create(:tenant)
#     @invalid_user = FactoryGirl.create(:user, tenant: other_account)
#     @account = FactoryGirl.create(:tenant, subdomain: "test-account")
#     @user = FactoryGirl.create(:user, tenant: @account)
#     Capybara.app_host = "http://test-account.example.com"
#     visit '/'
#   end

  describe "log in to a valid account" do
    before do
      page.should have_content "Dashboard"
    end

    # it "will notify me that I have logged in successfully" do
    #   click_link "Sign in here"
    #   fill_in "email", with: @user.email
    #   fill_in "password", with: @user.password
    #   click_button 'Login'
    #   page.should have_content "Dashboard"
    # end

  end
end


describe "LoginToAccounts with non-valid credentials" do
  before do
    @tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    c = Category.create(name: "Staff")
    r = Role.create(name: "Administrator")
    @user = User.create(email: "hello@example.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @tenant.users << @user
    Capybara.app_host = "http://test-account.example.com"
    visit '/'
    click_link "Sign in here"
      fill_in 'email', with: 'mike@jimbob.com'
      fill_in 'password', with: 'password'
    click_button 'Login'
  end

  describe "fail login for nonuser" do
    before do
      page.should_not have_content "Dashboard"
    end

    # it "will not notify me that I have logged in successfully" do
    #   fill_in "email", with: @user.email
    #   fill_in "password", with: @user.password
    #   click_button 'Login'
    #   page.should_not have_content "Dashboard"
    # end
  end

end