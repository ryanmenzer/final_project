require 'spec_helper'

describe PaypalPayment do
  describe "model validations" do
    it "should belong to sponsorship" do
      paypalPayment = PaypalPayment.reflect_on_association(:sponsorship)
      paypalPayment.macro.should == :belongs_to
    end

    it "should belong to payer" do
      paypalPayment = PaypalPayment.reflect_on_association(:payer)
      paypalPayment.macro.should == :belongs_to
    end

    it "should have many transactions" do
      paypalPayment = PaypalPayment.reflect_on_association(:transactions)
      paypalPayment.macro.should == :has_many
    end
  end
end
