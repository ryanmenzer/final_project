class ReceiversController < ApplicationController
  filter_access_to :all
	def index
	end

	def new
		puts "======new method params=========="
		puts params
		@initiative = Initiative.find(params[:initiative_id])
		@receiver = Receiver.new
		if params[:type] == "person"
			@people = Person.where(:category_id => [1, 2]).order("full_name ASC")
		elsif params[:type] == "project"
			@projects = Project.all.sort_by { |p| p.name }
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