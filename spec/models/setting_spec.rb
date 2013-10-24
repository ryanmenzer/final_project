require 'spec_helper'

describe Setting do

  context "model validations" do

    it "should belong to tenant" do
      setting = Setting.reflect_on_association(:tenant)
      setting.macro.should == :belongs_to
    end

    it "should belong to primary contact" do
      setting = Setting.reflect_on_association(:primary_contact)
      setting.macro.should == :belongs_to
    end

    it "should belong to logo" do
      setting = Setting.reflect_on_association(:logo)
      setting.macro.should == :belongs_to
    end

    it "should have one paypal setting" do
      setting = Setting.reflect_on_association(:paypal_setting)
      setting.macro.should == :has_one
    end

    it "should have one mandrill setting" do
      setting = Setting.reflect_on_association(:mandrill_setting)
      setting.macro.should == :has_one
    end
  end
end