require 'spec_helper'

describe MandrillSetting do
  describe "model validations" do
    it "should belong to setting" do
      mandrill_setting = Frequency.reflect_on_association(:setting)
      mandrill_setting.macro.should == :belongs_to
    end
  end
end
