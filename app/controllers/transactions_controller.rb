class TransactionsController < ApplicationController
  filter_access_to :all
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


  def paypal_create

    sponsorship = Sponsorship.find(params[:sponsorship_id])
    @paypal_payment = PaypalPayment.create(active: false,
                                   amount: params[:amount],
                                   payer_id: params[:payer_id])

    sponsorship.paypal_payments << @paypal_payment

    ppr = PayPal::Recurring.new(
      return_url: paypal_checkout_url(id: params[:sponsorship_id]),
      cancel_url: request.referrer,
      description: "Test transaction",
      amount: params[:amount],
      currency: "USD"
      )

     response = ppr.checkout

    if response.valid?
      session[:paypal_payment_id] = @paypal_payment.id
      redirect_to response.checkout_url
    else
      raise response.errors.inspect
    end

  end

  def paypal_checkout
    @paypal_payment = PaypalPayment.find(session[:paypal_payment_id])
    @paypal_payment.update_attributes(paypal_payer_id: params[:PayerID],
                                      paypal_token: params[:token])

    @sponsorship = Sponsorship.find(params[:id])
    redirect_to @sponsorship
  end

end
