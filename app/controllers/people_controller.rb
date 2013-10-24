class PeopleController < ApplicationController
  filter_access_to :all
  def index
    if params[:cat]
      @people = Person.where(category_id: params[:cat]).paginate(page: params[:page])
    else
      @people = Person.paginate(page: params[:page])
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

    redirect_to people_path
  end

  def editroleform 
    @person = Person.find(params[:id])
    @roleall = Role.all
  end 

  def editrole
    p role_id = params[:person][:id]
    p user_id = params[:id]
    user = User.find(user_id)
    user.role_id = role_id
    user.save
    redirect_to(person_path(user))
  end 

end


