class ImagesController < ApplicationController

	def index
		# @image = Image.last
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(params[:image])
		render :index
	end

end
