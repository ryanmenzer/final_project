require 'spec_helper'

describe Initiative do
    context "Validations and Associations" do
      context "Saving" do

        before do
          @tenant = Tenant.create!(org_name: "Hello Inc")
          Tenant.set_current_tenant @tenant.id
          Category.create(name: "Staff")
          r = Role.create!(name: "Administrator")
          @user = FactoryGirl.create(:user, role_id: r.id)
          @tenant.users << @user
          manager = FactoryGirl.create(:person, user: @user, category_id: 1)
          @initiative =   Initiative.new(manager_id: manager.id,
                      initiative_type_id: 0,
                      title: "Initiative Title")
          @initiative_no_title =   Initiative.new(manager_id: manager.id,
                      initiative_type_id: 0)
          @initiative_no_typeid =   Initiative.new(manager_id: manager.id,
                      title: "Initiative Title")
        end

      it "should save an initiative with a title and a type id" do
        expect(@initiative.save).to eq(true)
      end

      it "should not save an initiative without a title" do
        expect{@initiative_no_title.save}.to raise_error(ActiveRecord::StatementInvalid)
      end

      it "should not save an initiative without a type id" do
        expect{@initiative_no_typeid.save}.to raise_error(ActiveRecord::StatementInvalid)
      end

    end

    context "model validations" do

      it "should belong to a manager" do
        initiative = Initiative.reflect_on_association(:manager)
        initiative.macro.should == :belongs_to
      end

      it "should have many sponsorships" do
        initiative = Initiative.reflect_on_association(:sponsorships)
        initiative.macro.should == :has_many
      end

      it "should have many receivers" do
        initiative = Initiative.reflect_on_association(:receivers)
        initiative.macro.should == :has_many
      end

      it "should have many stories" do
        initiative = Initiative.reflect_on_association(:stories)
        initiative.macro.should == :has_many
      end

      it "should have many images" do
        initiative = Initiative.reflect_on_association(:images)
        initiative.macro.should == :has_many
      end
    end

  end
end