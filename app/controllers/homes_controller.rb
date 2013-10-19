class HomesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [ :index ]

  def index
    @user = all_users
  end
end
