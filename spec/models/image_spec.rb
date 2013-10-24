require 'spec_helper'

describe Image do
    context "validations and associations" do
      context "saving" do
        before do
          @tenant = Tenant.create!(org_name: "Hello Inc")
          Tenant.set_current_tenant @tenant.id
          @image = Image.new(title: "This is the title",
                            url: "http://www.google.com")
          @image_no_url = Image.new(title: "This is the title")
          @image_no_title = Image.new(url: "http://www.google.com")
        end

      it "should save an image with a title and a url" do
        expect(@image.save).to eq(true)
      end

      it "should not save an image without a url" do
        expect{@image_no_url.save}.to raise_error(ActiveRecord::StatementInvalid)
      end

      it "should not save a story without a title" do
        expect{@image_no_title.save}.to raise_error(ActiveRecord::StatementInvalid)
      end
    end

    context "model validations" do

      it "should belong to person" do
        image = Image.reflect_on_association(:person)
        image.macro.should == :has_one
      end

      it "should belong to imageable" do
        image = Image.reflect_on_association(:imageable)
        image.macro.should == :belongs_to
      end
    end
  end
end

