require 'mandrill' 
class EmailsController < ApplicationController
 
  def index

  end 

  def create

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