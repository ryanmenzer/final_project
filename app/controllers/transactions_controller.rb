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

  def paypal_checkout
    transaction = Transaction.find(params[:transaction_id])
    ppr = PayPal::Recurring.new(
      return_url: new_transaction_url(:transaction_id => transaction.id),
      cancel_url: root_url,
      description: transaction.id,
      amount: transaction.amount,
      currency: "USD"
      )

    response = ppr.checkout
    if response.valid?
      redirect_to response.checkout_url
    else
      raise response.errors.inspect
    end

  end

end 
