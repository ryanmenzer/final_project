class InitiativesController < ApplicationController

	def index
		@initiatives = Initiative.all
	end

	def new
		@initiative = Initiative.new
	end

	def create
		initiative = Initiative.new(params[:initiative])
		initiative.initiative_type_id = 0
		initiative.save!
		redirect_to action: "index"
	end

	def show
		@initiative = Initiative.find(params[:id])
		puts "====== @initiative.recievers ========="
		puts @receivers = @initiative.receivers
		# @receivers = Person.find()
	end

	def edit
		@initiative = Initiative.find(params[:id])
	end

	def update
		@initiative = Initiative.find(params[:id])

		if @initiative.update_attributes(params[:initiative])
			redirect_to @initiative
		else
			render 'edit'
		end
	end

	def destroy
		@initiative = Initiative.find(params[:id])
		@initiative.destroy
		redirect_to action: "index"
	end

end