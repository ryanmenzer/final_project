class GroupsController < ApplicationController
  def index 
    @groups = Group.paginate(page: params[:page])
  end 

  def new 
    @group = Group.new
  end 

  def show 
    @group = Group.find(params[:id])
  end 

  def edit 
    @group = Group.find(params[:id]) 
  end 

  def create 
    @group = Group.create(params[:group])
    redirect_to action: "index"
  end 

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to @group 
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to action: "index"
  end  

  def addperson
    groupid = params[:group][:id]
    personid = params[:id]
    group = Group.find(groupid)
    group.members << Person.find(personid)
    redirect_to(people_path)
  end 

  def addgroup 
    @person = Person.find(params[:id])
    @groupall = Group.all
  end 

  def removeperson
    person = Person.find(params[:personid])
    group = Group.find(params[:groupid])
    group.members.delete(person) 
    redirect_to(group_path(group))
  end 


end 