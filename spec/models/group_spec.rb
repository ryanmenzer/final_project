require 'spec_helper'

describe Group do

  context "validations and associations" do

    context "saving" do

      before do
        tenant = Tenant.create(org_name: "Hello Inc")
        Tenant.set_current_tenant tenant.id
        c = Category.create(name: "Staff")
        r = Role.create(name: "Administrator")
        user = User.create(email: "hello@hello.com",
                   password: "password",
                   password_confirmation: "password",
                   role_id: r.id)
        user2 = User.create(email: "hello@hello.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
        manager =  Person.create(full_name: "Jim John Joe",
                              user_id: user.id,
                              category_id: 1,
                              gender: "male",
                              nationality: "American",
                              email: "jim@hello.com")
        @group = Group.new(name: "First Group", manager_id: manager.id)
        @group_no_manager = Group.new(name: "Second Group")
        @group1 = @group.save
      end

    it "should save a group with manager id" do
      expect(@group.save).to eq(true)
    end

    it "should not save a sponsorship without an manager id" do
      expect{@group_no_manager}.to raise_error(ActiveRecord::StatementInvalid)
    end
  end

  context "model associations" do
    it "should belong to manager" do
      group = Group.reflect_on_association(:manager)
      group.macro.should == :belongs_to
    end

    it "should have and belong to many members" do
      group = Group.reflect_on_association(:members)
      group.macro.should == :has_and_belongs_to_many
    end
  end
  end
end
