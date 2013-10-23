class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
    @transaction.sponsorship_id = params[:sponsorship_id]
    @transaction.transaction_type_id = params[:transaction_type_id]
    @sponsorship = Sponsorship.find(params[:sponsorship_id])
    @sponsor = @sponsorship.sponsors
  end

  def show
    @transaction = Transaction.find(params[:transaction_id])
  end

  def create
    @transaction = Transaction.create(params[:transaction])
    redirect_to @transaction.sponsorship
  end

  def edit 
    @transaction = Transaction.find(params[:id])
    @transaction.sponsorship_id = params[:sponsorship_id]
    @transaction.transaction_type_id = params[:transaction_type_id]
    @sponsorship = Sponsorship.find(params[:sponsorship_id])
    @sponsor = @sponsorship.sponsors 
  end 

  def update 
    @transaction = Transaction.find(params[:id])

    if @transaction.update_attributes(params[:transaction])
      redirect_to @transaction.sponsorship
    else 
      render 'edit'
    end 
  end 

  def index

  end

  def destroy 
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to @transaction.sponsorship
  end 

end 

  def paypal_create
        
    sponsorship = Sponsorship.find(params[:sponsorship_id])

    PaypalPayment.create(payer_id: sponsorship.sponsors.first.id,
                                           sponsorship_id: sponsorship.id,
                                           active: false,
                                           amount: params[:amount])
    
    puts  '*'*100 
    puts  PaypalPayment.last.amount
    puts  '*'*100 
 
    ppr = PayPal::Recurring.new(
      return_url: paypal_checkout_url(id: params[:sponsorship_id]),
      cancel_url: request.referrer,
      description: "Test transaction",
      amount: params[:amount],
      currency: "USD"
      )
    
    response = ppr.checkout

    if response.valid?
      redirect_to response.checkout_url 
    else
      raise response.errors.inspect
    end
    
  end

  def paypal_checkout
    @sponsorship = Sponsorship.find(params[:id])
    @sponsorship.sponsors.first.id
    
   pp = @sponsorship.paypal_payments.first

    puts  '*'*100 
    puts  pp.amount
    puts  '*'*100    
    
    @paypal_payment = pp.update_attributes(paypal_payer_id: params[:PayerID],
                                           paypal_token: params[:token],
                                           )
    redirect_to @sponsorship
  end

end
