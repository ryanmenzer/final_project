class StoriesController < ApplicationController
  filter_access_to :all
  def new
    @story = Story.new
    @story.author_id = current_user.id
    @story.storyable_id = params[:object_id]
    @story.storyable_type = params[:object_type]
  end

  def create
    @story = Story.create(params[:story])
    if params[:send_email]
      email_story(@story)
    end
  end

  def show

  end


  def index

  end

end
