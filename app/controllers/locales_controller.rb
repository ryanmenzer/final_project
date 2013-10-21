
class LocalesController < ApplicationController

	def show
	  if current_user # if logged in
	    current_user.locale = params[:locale] # change users locality
	    current_user.save
	  else
		  session[:locale] = params[:locale]
		  redirect_to :back
	  end
	end

end

