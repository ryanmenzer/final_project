require 'spec_helper'

describe Receiver do
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
    @person =  Person.create(full_name: "Jim John Joe",
                          user_id: @user.id,
                          category_id: c.id,
                          gender: "male",
                          nationality: "American", 
                          email: "jim@hello.com")
		manager =  Person.create(full_name: "Jim John Joe",
                          user_id: @user.id,
                          category_id: 1,
                          gender: "male",
                          nationality: "American",
                          email: "jim@hello.com")
		initiative = Initiative.create(manager_id: manager.id,
		                  initiative_type_id: 0,
		                  title: "Awesome Initiative",
		                  description: "Super amazing empowering initiative",
		                  goal: 1000000,
		                  active: true,
		                  start_date: DateTime.now())
		@project = Project.create(manager_id: manager.id,
		                   name: "Innovative General Stuff")
		@receiver = Receiver.new(initiative_id: initiative.id,
		                   receiverable: @project)
		@receiver_no_id = Receiver.new(
		                   receiverable: @project)
		@receiver_no_project = Receiver.new(initiative_id: initiative.id)
	end

	  context "Validations and Associations" do

	    it "should save a receiver with initiative id and a project" do
	      expect(@receiver.save).to eq(true)
	    end  

	   	it "should not save a receiver without an initiative id" do
		    expect{@receiver_no_id.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end

	   	it "should not save a receiver without a project" do
		    expect{@receiver_no_project.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end

		  it "should belong to initiative" do
		    receiver = Receiver.reflect_on_association(:initiative)
		    receiver.macro.should == :belongs_to
		  end

		  it "should belong to receiverable" do
		    receiver = Receiver.reflect_on_association(:receiverable)
		    receiver.macro.should == :belongs_to
		  end

		  it "should have and belong to many sponsorships" do
		    receiver = Receiver.reflect_on_association(:sponsorships)
		    receiver.macro.should == :has_and_belongs_to_many
		  end
    end
end
