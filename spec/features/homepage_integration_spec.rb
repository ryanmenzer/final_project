require 'spec_helper'
require 'support/user_helper'

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
  end

  it "Should have general content" do
    body.should have_css('.box-header', visible: "Most Recent Stories")
    body.should have_css('.box-header', visible: "Last Updated Initiative")
    body.should have_css('.box-header', visible: "Current People Stats")
    body.should have_css('.box-header', visible: "Last Updated Funding Stats")
    body.should have_css('.box-header', visible: "All Images")
  end

  it "Should have a sidebar with various options" do
    page.should have_link "Dashboard"
    page.should have_link "Our People"
      page.should have_link "List All"
    page.should have_link "Supporters"
    page.should have_link "Staff"
    page.should have_link "Initiatives"
    page.should have_link "Groups"
    page.should have_link "Settings"
  end

  it "Should have top navigation bar with language selector" do
     page.should have_content t('top_nav.select_language')
  end

  it "clicks on the People: List All link" do
    click_link('List All', match: :first)
    body.should have_content "All People"
  end

  # it "clicks on the Supporters: List All link" do
  #   click_link('List All', '/people?cat=3')
  #   page.should have_content "Supporter"
  # end

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

