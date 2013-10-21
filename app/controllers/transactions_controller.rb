class TransactionsController < ApplicationController

  def new 
    @transaction = Transaction.new
    @transaction.sponsorship_id = params[:sponsorship_id]
    @transaction.transaction_type_id = params[:transaction_type_id]
    @sponsorship = Sponsorship.find(params[:sponsorship_id])
    @sponsor = @sponsorship.sponsors 
  end 

  def show

  end

  def create
    p params[:transaction]
    @transaction = Transaction.create(params[:transaction])
    redirect_to @transaction.sponsorship
  end 

  def index

  end
end 
