require 'spec_helper'

describe User do
	context "validations and associations" do
		context "saving" do
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
			             password_confirmation: "password")
			  @tenant.users << @user
		  end

		  it "should not save a user without an email" do
		    expect(@user_no_email.save).to eq(false)
		  end

		  it "should not save a user with a blank password" do
		    expect(@user_blank_password.save).to eq(false)
		  end

		  it "should not save a user without role id" do
		    expect{@user_no_rid.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end
    end

	  context "model validations" do
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

	  context "field validations" do
      it {should have_db_column(:email).of_type(:string).with_options(:null => false, :default => "" ) }
      it {should have_db_column(:encrypted_password).of_type(:string).with_options(:null => false, :default => "" ) }
      it {should have_db_column(:tenant_id).of_type(:integer) }
      it {should have_db_column(:role_id).of_type(:integer).with_options(:null => false ) }
      it {should have_db_column(:reset_password_token).of_type(:string) }
      it {should have_db_column(:reset_password_sent_at).of_type(:datetime) }
      it {should have_db_column(:remember_created_at).of_type(:datetime) }
      it {should have_db_column(:sign_in_count).of_type(:integer).with_options(:default => 0 ) }
      it {should have_db_column(:current_sign_in_at).of_type(:datetime) }
      it {should have_db_column(:last_sign_in_at).of_type(:datetime) }
      it {should have_db_column(:current_sign_in_ip).of_type(:string) }
      it {should have_db_column(:last_sign_in_ip).of_type(:string) }
    end
  end
end



