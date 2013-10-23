class ImagesController < ApplicationController
  filter_access_to :all
	def index
		@images = Image.all
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(params[:image])
		@image_for_id = params[:image_for][:id]
		@image_for_type = params[:image_for][:type]

		case @image_for_type
		when "user-profile"
			p = User.find(@image_for_id).person
			p.profile_picture_id = @image.id
			p.save!
			redirect_to :back and return
		when "settings"
			s = Setting.find(@image_for_id)
			s.logo_id = @image.id
			s.save!
			redirect_to :back and return
		end
		redirect_to action: "index"
	end

end
