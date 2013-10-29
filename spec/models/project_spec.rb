require 'spec_helper'

describe Project do
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
        @tenant.users << @user
        manager =  Person.new(full_name: "Jim John Joe",
                              user_id: @user.id,
                              category_id: 1,
                              gender: "male",
                              nationality: "American",
                              email: "jim@hello.com")
    		@project = Project.new(manager_id: 1,
    		                   name: "Innovative General Stuff")
    		@project_no_name = Project.new(manager_id: 1,
    		                   # name: "Innovative General Stuff"
    		                   )
    		@project_no_manager = Project.new(
    			                 # manager_id: ,
    		                   name: "Innovative Specific Stuff"
    		                   )
        end

	    it "should save a project with a name" do
	      expect(@project.save).to eq(true)
	    end

	   	it "should not save a project without a manager id" do
		    expect{@project_no_manager.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end

	   	it "should not save a project without a name" do
		    expect{@project_no_name.save}.to raise_error(ActiveRecord::StatementInvalid)
		  end
    end

    context "model validations" do
		  it "should belong to manager" do
		    project = Project.reflect_on_association(:manager)
		    project.macro.should == :belongs_to
		  end

		  it "should have many stories" do
		    project = Project.reflect_on_association(:stories)
		    project.macro.should == :has_many
		  end

		  it "should have many receivers" do
		    project = Project.reflect_on_association(:receivers)
		    project.macro.should == :has_many
		  end

		  it "should have many images" do
		    project = Project.reflect_on_association(:images)
		    project.macro.should == :has_many
      end
	  end

    context "field validations" do
      it {should have_db_column(:tenant_id).of_type(:integer).with_options(:null => false ) }
      it {should have_db_column(:manager_id).of_type(:integer).with_options(:null => false ) }
      it {should have_db_column(:name).of_type(:string).with_options(:null => false ) }
    end

    context "database index validations" do
      it { should have_db_index(:tenant_id) }
      it { should have_db_index(:manager_id) }
      it { should have_db_index(:name) }
    end
  end
end
