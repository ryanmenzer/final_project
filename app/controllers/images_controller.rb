class ImagesController < ApplicationController

	def index
		@image = Image.last
		# @images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(params[:image])
		redirect_to :index
		# render @image

		# uploader = ImageUploader.new
		# uploader.store!(params[:image])
		# @image = uploader.retrieve_from_store!(params[:image])
		# puts "=============="
		# puts uploader
		# puts "=============="

		# render :index

		# @image = Image.new(:title => "test", :url => "http://www.test.com")
		# @image.save
		# redirect_to "new"
		# # if @image.save
		# # 	render "index"
		# # else
		# # 	render 'new'
		# # end
	end

end
