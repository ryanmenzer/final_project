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

  it "should have a sidebar with various options" do
    page.should have_content "Dashboard"
    page.should have_content "Our People"
    page.should have_link "Supporters"
    page.should have_link "Staff"
    page.should have_link "Initiatives"
  end

end