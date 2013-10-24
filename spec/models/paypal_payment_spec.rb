require 'spec_helper'

describe PaypalPayment do
  describe "model validations" do
    it "should belong to sponsorship" do
      paypal_payment = PaypalPayment.reflect_on_association(:sponsorship)
      paypal_payment.macro.should == :belongs_to
    end

    it "should belong to payer" do
      paypal_payment = PaypalPayment.reflect_on_association(:payer)
      paypal_payment.macro.should == :belongs_to
    end

    it "should have many transactions" do
      paypal_payment = PaypalPayment.reflect_on_association(:transaction)
      paypal_payment.macro.should == :has_many
    end
  end
end
