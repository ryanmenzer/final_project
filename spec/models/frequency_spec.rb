require 'spec_helper'

describe Frequency do
  context "model validations" do

    it "should have many sponsorships" do
      frequency = Frequency.reflect_on_association(:name)
      frequency.macro.should == :has_many
    end
  end
end
