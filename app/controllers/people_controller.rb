class PeopleController < ApplicationController

	def index
		@people = Person.all
	end

	def new
		@person = Person.new
		@category = Category.all
	end

	def create
		@person = Person.new(params[:person])
		@person.save
		render 'new_person'
	end

end
             #      people GET    /people(.:format)              people#index
             #             POST   /people(.:format)              people#create
             #  new_person GET    /people/new(.:format)          people#new
             # edit_person GET    /people/:id/edit(.:format)     people#edit
             #      person GET    /people/:id(.:format)          people#show
             #             PUT    /people/:id(.:format)          people#update
             #             DELETE /people/:id(.:format)          people#destroy