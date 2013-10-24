class StoriesController < ApplicationController
  filter_access_to :all
  def new
    @story = Story.new
    @story.author_id = current_user.id
    @story.storyable_id = params[:object_id]
    @story.storyable_type = params[:object_type]
  end

  def create

    story = Story.new(params[:story])
    story.author_id = current_user.id
    storycomplete = story 
    story.save!

    # puts "hi"
    # p params
    # story_title = params[:story][:title]
    # story_content = params[:story][:content]
    # storyable_id = params[:storyable_for][:id]
    # storyable_type = params[:storyable_for][:type]
    # author_id = current_user.id
    # @story = Story.new
    # @story.title = story_title
    # @story.content = story_content
    # @story.storyable_id = storyable_id
    # @story.storyable_type = storyable_type
    # @story.author_id = author_id
    # puts "hello"
    # p @story 
    # storycomplete = @story
    # storycomplete.save
    # puts "hey"
    p params[:story][:send_email]
      if params[:story][:send_email] == 1
        email_story(storycomplete)
      end
    flash[:success] = "Your email has been sent to sponsors"
    redirect_to :back
  end

  def show

  end


  def index

  end

end
