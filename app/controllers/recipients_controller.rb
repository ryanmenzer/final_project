class RecipientsController < ApplicationController

  def index
    @recipients = Person.where(category_id: 2)
  end

  def new

  end

  def show 
    @recipient = Person.find(params[:id])
  end 

  def create
  end

end
