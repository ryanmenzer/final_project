class ImagesController < ApplicationController

	def index
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(:title => "test", :url => "http://www.test.com")
		@image.save
		redirect_to "new"
		# if @image.save
		# 	render "index"
		# else
		# 	render 'new'
		# end
	end

end