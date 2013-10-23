class HomesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [ :index ]
  filter_access_to :all
  def index
    # @initiative = Initiative.first
    @initiative = Initiative.order("updated_at DESC").limit(1).first
    @initiatives = Initiative.order("updated_at DESC").limit(2)
    @stories = Story.limit(10)
    @images = Image.limit(10)
    @people = Person.all
  end

end
