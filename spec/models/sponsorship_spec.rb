require 'spec_helper'

describe Sponsorship do
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
		r = Receiver.create(initiative_id: initiative.id,
		                   receiverable: project)
		@sponsorship = Sponsorship.new(initiative_id: initiative.id,
		                  frequency_id: 0,
		                  recurring_payment: true,
		                  amount: 200000,
		                  active: true,
		                  start_date: DateTime.now())
		s              = @sponsorship.save
		@sponsorship_no_id = Sponsorship.new(
		                  frequency_id: 0,
		                  recurring_payment: true,
		                  amount: 200000,
		                  active: true,
		                  start_date: DateTime.now())
		
  end

	  context "Validations and Associations" do

	    it "should save a sponsorship with initiative id" do
	      expect(@sponsorship.save).to eq(true)
	    end  

	   	it "should not save a sponsorship without an initiative id" do
		    expect{@sponsorship_no_id.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end

		  it "should belong to frequency" do
		    sponsorship = Sponsorship.reflect_on_association(:frequency)
		    sponsorship.macro.should == :belongs_to
		  end

		  it "should belong to initiative" do
		    sponsorship = Sponsorship.reflect_on_association(:initiative)
		    sponsorship.macro.should == :belongs_to
		  end

		  it "should have and belong to many sponsors" do
		    sponsorship = Sponsorship.reflect_on_association(:sponsors)
		    sponsorship.macro.should == :has_and_belongs_to_many
		  end

		  it "should have and belong to many receivers" do
		    sponsorship = Sponsorship.reflect_on_association(:receivers)
		    sponsorship.macro.should == :has_and_belongs_to_many
		  end

		  it "should have many transactions" do
		    sponsorship = Sponsorship.reflect_on_association(:transactions)
		    sponsorship.macro.should == :has_many
		  end
    end
end
