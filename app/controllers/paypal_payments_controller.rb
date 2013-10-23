class PaypalPaymentsController < ApplicationController
  def confirm_payment
    pp = PaypalPayment.find(params[:id])
    ppr = PayPal::Recurring.new({
      :token       => pp.paypal_token,
      :payer_id    => pp.paypal_payer_id,
      :amount      => pp.amount,
      :description => "Test"
    })
    response = ppr.request_payment
    puts response.approved?
    puts response.completed?
  end
end
