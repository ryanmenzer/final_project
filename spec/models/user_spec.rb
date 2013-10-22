require 'spec_helper'

	describe User do
		before do
			@tenant = Tenant.create(org_name: "Hello Inc")
		  Tenant.set_current_tenant @tenant.id
		  c = Category.create(name: "Staff")
		  r = Role.create(name: "Administrator")
		  @user = User.create(email: "hello@hello.com",
		             password: "password",
		             password_confirmation: "password",
		             role_id: r.id)
		  @user_no_email = User.new(
		  	         # email: "hello1@hello.com",
		             password: "password",
		             password_confirmation: "password",
		             role_id: r.id)
	    @user_blank_password = User.new(
		  	         email: "hello2@hello.com",
		             password: "",
		             password_confirmation: "",
		             role_id: r.id)
		  @user_no_rid  = User.new(
		  	         email: "hello2@hello.com",
		             password: "password",
		             password_confirmation: "password",
		             # role_id: r.id
		             )
		  @tenant.users << @user
    end

		context "Validations and Associations" do

			  it "should not save a user without an email" do
			    expect(@user_no_email.save).to eq(false)
			  end  

			  it "should not save a user with a blank password" do
			    expect(@user_blank_password.save).to eq(false)
			  end  

			  it "should not save a user without role id" do
			    expect{@user_no_rid.save}.to raise_error(ActiveRecord::StatementInvalid)
			  end  

			  it "should belong to role" do
			    user = User.reflect_on_association(:role)
			    user.macro.should == :belongs_to
			  end

			  it "should have one primary contact" do
			    user = User.reflect_on_association(:primary_contact)
			    user.macro.should == :has_one
			  end

			  it "should have one person" do
			    user = User.reflect_on_association(:person)
			    user.macro.should == :has_one
			  end
    end
end
