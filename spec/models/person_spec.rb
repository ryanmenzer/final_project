require 'spec_helper'

describe Person do
	context "validations and associations" do
    context "saving" do
      before do
        @tenant = Tenant.create!(org_name: "Hello Inc")
        Tenant.set_current_tenant @tenant.id
        c = Category.create!(name: "Staff")
        r = Role.create!(name: "Administrator")

        @user = FactoryGirl.create(:user, role_id: r.id)
        @tenant.users << @user

        @person =  FactoryGirl.build(:person, user: @user, category: c)
        @person_no_cid = FactoryGirl.build(:person_no_cid, user: @user)
      end

      it "should save a person with a category id" do
        expect(@person.save).to eq(true)
      end

     # With {}: proc doesn't execute the code / lets rspec catch the exception
  	  it "should not save a person without a category id" do
  	    expect{@person_no_cid.save}.to raise_error(ActiveRecord::StatementInvalid)
  	  end
    end

    context "model validations" do
      it "should belong to category" do
        person = Person.reflect_on_association(:category)
        person.macro.should == :belongs_to
      end

      it "should belong to user" do
        person = Person.reflect_on_association(:user)
        person.macro.should == :belongs_to
      end

      # THIS SHOULD BE FIXED AND TEST REMOVED
      # Has both has_and_belongs_to_many AND has_many
      it "should have many groups" do
        pending "something to merge from master??"
        person = Person.reflect_on_association(:groups)
        person.macro.should == :has_many
      end

      it "should have many stories" do
        person = Person.reflect_on_association(:stories)
        person.macro.should == :has_many
      end

      it "should have many projects" do
        person = Person.reflect_on_association(:projects)
        person.macro.should == :has_many
      end

      it "should have many initiatives" do
        person = Person.reflect_on_association(:initiatives)
        person.macro.should == :has_many
      end

      it "should have many images" do
        person = Person.reflect_on_association(:images)
        person.macro.should == :has_many
      end

      it "should have and belong to many sponsorships" do
        person = Person.reflect_on_association(:sponsorships)
        person.macro.should == :has_and_belongs_to_many
      end

      it "should have and belong to many groups" do
        person = Person.reflect_on_association(:groups)
        person.macro.should == :has_and_belongs_to_many
      end
    end
	end
end
