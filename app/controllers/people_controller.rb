class PeopleController < ApplicationController

  def index
    if params[:cat]
      @people = Person.where["category_id = 1"]
    else
      @people = Person.where["category_id IS 1"]
    end
  end

  def new
  end

  def create
  end

end
