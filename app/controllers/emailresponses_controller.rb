class EmailresponsesController < ApplicationController
  def index

  end 

  def create
    puts "hello"
    if request.xhr?
      {success: true}.to_json
    end
  end 

end 