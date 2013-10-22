class UsersController < ApplicationController

  def index
  end

  def new

  end

  def show
    @user = User.find(params[:id])
    @image = Image.new
  end

  def create
  end



end
