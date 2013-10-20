require 'mandrill' 
class EmailsController < ApplicationController
 
  def show

  end 


  def index

  end 

  def create
    subject =  params[:email][:title]
      text = params[:email][:text]

      story = Story.new(title: subject, content: text, author_id: current_user.person.id)

    if params[:save_button] 
      story.save
    elsif params[:save_send_button]
      story.save

      # params[recipient].stories << story #this is the receiver being written about

      m = Mandrill::API.new
      message = {    
      :subject=> params[:email][:title],  
      :from_name=> "Your name",    
      :text=> params[:email][:text],  
      :to=>[  
       {  
       :email=> "titipongpisit@hotmail.com",  
       :name=> "Sponsored"  
       }  
       ],  
       # :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
       :from_email=>"titipongpisit2013@gmail.com"  
       }  
       sending = m.messages.send message 
     end 
  end

end 