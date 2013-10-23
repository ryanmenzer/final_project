class Initiative < ActiveRecord::Base

  # include Searchable

  # after_save do
  #   make_searchable :title
  # end

  acts_as_tenant

  attr_accessible :manager_id,
                  :initiative_type_id,
                  :title,
                  :description,
                  :goal,
                  :active,
                  :start_date,
                  :end_date

  belongs_to :manager, class_name: "Person"
  has_many   :sponsorships
  has_many   :receivers
  has_many   :stories
  has_many   :images, as: :imageable
  has_many   :stories, as: :storyable

  def people
    rec = self.receivers.where(:receiverable_type => "Person")
    rec.map do |r|
      r.receiverable
    end
  end

  def projects
    rec = self.receivers.where(:receiverable_type => "Project")
    rec.map do |r|
      r.receiverable
    end
  end

end
