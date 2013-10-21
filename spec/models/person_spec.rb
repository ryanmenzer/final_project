require 'spec_helper'

describe Person do
  before do
  	@tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    c = Category.create(name: "Staff")
    r = Role.create(name: "Administrator")
    @user = User.create(email: "hello@hello.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @tenant.users << @user
    @person =  Person.new(full_name: "Jim John Joe",
                          user_id: @user.id,
                          category_id: c.id,
                          gender: "male",
                          nationality: "American", 
                          email: "jim@hello.com")
    @person_no_cid =  Person.new(full_name: "Jane Jane",
                          user_id: @user.id,
                          # category_id: ,
                          gender: "female",
                          nationality: "American", 
                          email: "jane@hello.com")

  end
    
	context "Validations and Associations" do

    it "should save a person with a category id" do
      expect(@person.save).should eq(true)
    end  

	  it "should not save a person without a category id" do
	    expect(@person_no_cid.save).to raise_error(ActiveRecord::StatementInvalid)
	  end

     
	      it "should z" do
	      end
	end
end
