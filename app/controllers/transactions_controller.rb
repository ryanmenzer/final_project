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
