require 'spec_helper'


describe Tenant do
  before do
  	@tenant = Tenant.create(org_name: "Hello Inc")
  	@new_tenant = Tenant.new(org_name: '')
    Tenant.set_current_tenant @tenant.id
  end
  
  context "Validations and Associations" do
   #We can save empty string for user name
    it "should not save a tenant without an org name" do
      expect(@new_tenant.save).should eq(false)
    end  
  end
end
