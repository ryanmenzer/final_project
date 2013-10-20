class HomesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [ :index ]

  def index
    @people = Person.all
  end

end
