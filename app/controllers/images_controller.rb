class ImagesController < ApplicationController

	def index
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(params[:image])

		case params[:image_for][:type]
		when "user-profile"
			p = User.find(params[:image_for][:id]).person
			p.profile_picture_id = @image.id
			p.save!
			redirect_to :back and return
		end
		redirect_to action: "index"
	end

end
