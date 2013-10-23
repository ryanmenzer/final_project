class PaypalPaymentsController < ApplicationController
  
  def confirm_payment
    
    p '*'*75
    p params
    p '*'*75

    pp = PaypalPayment.find(params[:id])
    ppr = PayPal::Recurring.new({
      :token       => pp.paypal_token,
      :payer_id    => pp.paypal_payer_id,
      :amount      => pp.amount,
      :description => "Test transaction"
    })
    
    p '='*75
    response = ppr.request_payment
    puts response.approved?
    puts response.completed?

    redirect_to :back
  end

end
