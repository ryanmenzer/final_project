require 'mandrill' 
class EmailsController < ApplicationController
 
  
  def show
  @recipient = Person.find(params[:id])
  @sponsor = @recipient.active_sponsors

  end 


  def index

  end 

  def create
    puts "hi"

    p recipient_id = params[:email][:recipient_id]
    recipient = Person.find(recipient_id)
    # sponsor_email = recipient.active_sponsors      #right now it is still full name, email is not in schema yet
    sponsor_email = ["titipongpisit@hotmail.com", "titipongpisit2013@gmail.com"]


    subject =  params[:email][:title]
      text = params[:email][:text]

      story = Story.new(title: subject, content: text, author_id: current_user.person.id, storyable_id: recipient_id)

    if params[:save_button] 
      story.save
    elsif params[:save_send_button]
      story.save

      # params[recipient].stories << story #this is the receiver being written about

      sponsor_email.each do |sponsor_email|
      
      m = Mandrill::API.new
      message = {    
      :subject=> params[:email][:title],  
      :from_name=> "Your name",    #Tenant name
      :text=> params[:email][:text],  
      :to=>[  
       {  
       :email=> sponsor_email,  
       :name=> "Sponsored"         #Sponsor Name 
       }
       ],  
       # :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
       :from_email=>"titipongpisit2013@gmail.com"  
       }  
       sending = m.messages.send message 

      end 

     end 
  end

end 