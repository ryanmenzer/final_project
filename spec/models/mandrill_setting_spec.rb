require 'spec_helper'

describe MandrillSetting do
  describe "model validations" do
    it "should belong to setting" do
      mandrillSetting = MandrillSetting.reflect_on_association(:setting)
      mandrillSetting.macro.should == :belongs_to
    end
  end
end
