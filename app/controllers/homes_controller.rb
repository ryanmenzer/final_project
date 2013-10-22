class HomesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [ :index ]

  def index
    @initiative = Initiative.first
    @stories = Story.limit(10)
  end

end
