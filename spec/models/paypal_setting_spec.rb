require 'spec_helper'

describe PaypalSetting do
  context "model validations" do

    it "should belong to setting" do
      setting = PaypalSetting.reflect_on_association(:setting)
      setting.macro.should == :belongs_to
    end
  end
end
