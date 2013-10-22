require 'spec_helper'

describe Category do
  before do
  	@tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    @category = Category.new(name: "Staff")
    @category_no_name = Category.new()
  end

  	context "Validations and Associations" do
      it "should save a category with a name" do
        expect(@category.save).to eq(true)
      end  

     	it "should not save a category without a name" do
  	    expect{@category_no_name.save}.to raise_error(ActiveRecord::StatementInvalid)
  	  end

      it "should have people" do
        category = Category.reflect_on_association(:people)
        category.macro.should == :has_many
      end
    end
end
