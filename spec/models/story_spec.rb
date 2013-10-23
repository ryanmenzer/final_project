require 'spec_helper'

describe Story do
    context "Validations and Associations" do
      context "Saving" do
        before do

          @tenant = Tenant.create!(org_name: "Hello Inc")
          Tenant.set_current_tenant @tenant.id
          Category.create(name: "Staff")
          Category.create(name: "Recipient")
          Category.create(name: "Supporter")
          r = Role.create!(name: "Administrator")
          @user = FactoryGirl.create(:user, role_id: r.id)
          @tenant.users << @user
          recipient = FactoryGirl.create(:person, user: @user, category_id: 2)
          author = FactoryGirl.create(:person, user: @user, category_id: 2)
          @story = Story.new(title: "This is the title",
                            author_id: author.id)
          @story_no_author = Story.new(title: "This is the title",
                            content: "This is the content")
          @story_no_title = Story.new(author_id: author.id)
        end

      it "should save a story with a author id and a title" do
        expect(@story.save).to eq(true)
      end

      it "should not save a story without an author id" do
        expect{@story_no_author.save}.to raise_error(ActiveRecord::StatementInvalid)
      end

      it "should not save a story without a title" do
        expect{@story_no_title.save}.to raise_error(ActiveRecord::StatementInvalid)
      end
    end

    context "model validations" do

      it "should belong to author" do
        story = Story.reflect_on_association(:author)
        story.macro.should == :belongs_to
      end

      it "should belong to storyable" do
        story = Story.reflect_on_association(:storyable)
        story.macro.should == :belongs_to
      end

      it "should have many images" do
        story = Story.reflect_on_association(:images)
        story.macro.should == :has_many
      end
    end
  end
end

