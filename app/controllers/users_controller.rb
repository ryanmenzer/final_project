class UsersController < ApplicationController

  def index
  end

  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  

end
