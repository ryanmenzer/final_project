class PeopleController < ApplicationController

  def index
    if params[:cat]
      @people = Person.where(category_id: params[:cat])
    else
      @people = Person.all
    end
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

	def edit
		@person = Person.find(params[:id])
		@category = Category.all
	end

	def update
	  @person = Person.find(params[:id])

	  if @person.update_attributes(params[:person])
	    redirect_to @person
	  else
	    render 'edit'
	  end
	end

	def show
		@person = Person.find(params[:id])
	end

  def destroy
    person = Person.find(params[:id])
    person.destroy

    redirect_to 'people'
  end

end
             #      people GET    /people(.:format)              people#index
             #             POST   /people(.:format)              people#create
             #  new_person GET    /people/new(.:format)          people#new
             # edit_person GET    /people/:id/edit(.:format)     people#edit
             #      person GET    /people/:id(.:format)          people#show
             #             PUT    /people/:id(.:format)          people#update
             #             DELETE /people/:id(.:format)          people#destroy



