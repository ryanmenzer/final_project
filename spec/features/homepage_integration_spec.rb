require 'spec_helper'
require 'support/user_helper'
# include Warden::Test::Helpers
# Warden.test_mode!


include UserHelper


describe "Homepage" do

 before(:each) do
    @tenant = Tenant.create!(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    c = Category.create!(name: "Staff")
    r = Role.create!(name: "Administrator")
    @user = User.create!(email: "hello@hello.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @tenant.users << @user
    sign_in_user(@user)
    # click_link "Sign in here"
    # fill_in "email", with: @user.email
    # fill_in "password", with: @user.password
    # click_button 'Login'
  end

  it "Should have general content" do
    save_and_open_page
    body.should have_css('.box-header', visible: "Most Recent Stories")
    body.should have_css('.box-header', visible: "Last Updated Initiative")
    body.should have_css('.box-header', visible: "Current People Stats")
    body.should have_css('.box-header', visible: "Last Updated Funding Stats")
    body.should have_css('.box-header', visible: "All Images")
  end

  it "Should have a sidebar with various options" do
    page.should have_link t('menu.dashboard')
    page.should have_link "Our People"
    page.should have_link "Supporters"
    page.should have_content t('menu.staff')
    page.should have_link "Initiatives"
    page.should have_link "Groups"
    page.should have_link "Settings"
  end

  it "Should have top navigation bar with language selector" do
     page.should have_content t('top_nav.select_language')
  end

  it "clicks on the Staff" do
    find(".primary-sidebar").click_link("Staff")
    page.should have_content "Category" && "Staff"
  end

  it "clicks on Initiatives" do
    find(".primary-sidebar").click_link("Initiatives")
    page.should have_content "Title" && "Description" && "Initiatives"
  end

  it "clicks on Groups" do
    find(".primary-sidebar").click_link("Groups")
    page.should have_content "Groups" && "Group name" && "Leader"
  end

  # it "clicks on Settings" do
  #   find(".primary-sidebar").click_link("Settings")
  #   page.should have_content "Settings" && "Email Settings"
  # end

end

