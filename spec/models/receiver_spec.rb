require 'spec_helper'

describe Receiver do
	before do
    tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant tenant.id
    c = Category.create(name: "Staff")
    r = Role.create(name: "Administrator")
    user = User.create(email: "hello@hello.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
		manager =  Person.create(full_name: "Jim John Joe",
                          user_id: user.id,
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
		project = Project.create(manager_id: manager.id,
		               name: "Supercool Project")
		@receiver = Receiver.new(initiative_id: initiative.id,
		                   receiverable: project)
		@receiver_no_receiverable = Receiver.new(initiative_id: initiative.id)
  end

	  context "Validations and Associations" do

	    it "should save a receiver with initiative id and a receiverable" do
	      expect(@receiver.save).to eq(true)
	    end

	   	it "should not save a receiver without an initiative id" do
		    expect{@receiver_no_receiverable}.to raise_error(ActiveRecord::StatementInvalid)
		  end

		  it "should belong to initiative" do
		    receiver = Receiver.reflect_on_association(:initiative)
		    receiver.macro.should == :belongs_to
		  end

		  it "should belong to initiative" do
		    receiver = Receiver.reflect_on_association(:receiverable)
		    receiver.macro.should == :belongs_to
		  end

		  it "should have and belong to many sponsors" do
		    receiver = Receiver.reflect_on_association(:sponsorships)
		    receiver.macro.should == :has_and_belongs_to_many
		  end
    end
end
