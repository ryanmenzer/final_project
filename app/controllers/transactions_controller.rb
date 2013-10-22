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
    p params[:transaction]
    @transaction = Transaction.create(params[:transaction])
    redirect_to @transaction.sponsorship
  end

  def index

  end

  def paypal_create
    puts "======================================="
    puts params
    puts request.referrer
    puts "===================="
    ppr = PayPal::Recurring.new(
      return_url: paypal_checkout_url(id: params[:sponsorship_id]),
      cancel_url: request.referrer,
      description: "Test tranaction",
      amount: params[:amount],
      currency: "USD"
      )

    response = ppr.checkout
    if response.valid?
      redirect_to response.checkout_url and return
    else
      raise response.errors.inspect
    end


    redirect_to :back
  end

  def paypal_checkout
    puts "=================== PYAPAL CHECKOUT"
    puts params
    puts params[:token]
    puts params[:PayerID]
    puts params[:token]
    puts "==================="
    @sponsorship = Sponsorship.find(params[:id])
    @sponsorship.sponsors.first.id
    @paypal_payment = PaypalPayment.create(payer_id: @sponsorship.sponsors.first.id,
                                           sponsorship_id: @sponsorship.id,
                                           paypal_payer_id: params[:PayerID],
                                           paypal_token: params[:token],
                                           active: false)
    redirect_to @sponsorship
  end

end

 @paypal_payment = PaypalPayment.new(payer_id: 1,
                                          sponsorship_id: 1,
                                           paypal_payer_id: "kjhasdf76576as",
                                           paypal_token: "kjasdhkagshsdfa",
                                           active: false)


