class HomesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [ :index ]
  filter_access_to :all
  def index
    @people = Person.all
  end

end
