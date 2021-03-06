class InitiativesController < ApplicationController
	filter_access_to :all
	def index
		@initiatives = Initiative.paginate(page: params[:page])
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
		@initiative   = Initiative.find(params[:id])
		@stories      = Story.limit(10) # edit for specificity
		@sponsorships = @initiative.sponsorships.includes(receivers: [:receiverable])
		@people       = @initiative.people.sort_by { |p| p.full_name }
		@projects     = @initiative.projects.sort_by { |p| p.name }
		@sum          = @initiative.transactions.sum('amount')
	end

	def editreceivers
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
		puts @initiative
		@initiative.destroy
		redirect_to action: "index"
	end

end
