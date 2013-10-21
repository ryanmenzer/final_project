class ReceiversController < ApplicationController
	def index
	end

	def new
		puts "======new method params=========="
		puts params
		@receiver = Receiver.new
		if params[:type] == "person"
			@people = Person.where(:category_id => [1, 2])
		elsif params[:type] == "project"
			@projects = Project.all
		end
	end

	def create
		puts "=======create method params======="
		puts params
		receiver = Receiver.create!(:initiative_id => params[:initiative_id], :receiverable_id => params[:object_id], :receiverable_type => params[:object_type])
		redirect_to "/initiatives/#{params[:initiative_id]}"
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end
end