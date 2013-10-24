require 'spec_helper'

describe Role do

	context "model validations" do

		it "should have many users" do
		  role = Role.reflect_on_association(:users)
		  role.macro.should == :has_many
		end
  end

end

