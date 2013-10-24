class PaypalPaymentsController < ApplicationController

  filter_access_to :all
  
  def confirm_payment

    pp = PaypalPayment.find(params[:id])
    ppr = PayPal::Recurring.new({
      :token       => pp.paypal_token,
      :payer_id    => pp.paypal_payer_id,
      :amount      => pp.amount,
      :description => "Test transaction"
    })
    
    response = ppr.request_payment
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    p response
    p response.methods
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if response.approved?
      Transaction.create(transaction_type_id:  2,
                         sponsorship_id: pp.sponsorship_id,
                         payer_id: pp.payer_id,
                         date: DateTime.now,
                         amount: pp.amount
                         )

      flash[:success] = "Thank you. The payment has been approved"
    else
      flash[:error] = "Sorry. Something went wrong."
    end
    # puts response.completed?
    session.delete(:paypal_payment_id)
    redirect_to :back
  end

  def manage_recurring
    #have to add code to a view
    #need to create a recurring profile id
    #need to store a recurring profile id in db
    # ppr = PayPal::Recurring.new()
    
    # case 
    # when 
    #   ppr.suspend
    # when 
    #   ppr.reactivate
    # when 
    #   ppr.cancel
    # end
  
  end

end