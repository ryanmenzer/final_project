class Person < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :category_id,
                  :user_id,
                  :full_name,
                  :first_name,
                  :email,
                  :last_name,
                  :gender,
                  :date_of_birth,
                  :phone_number,
                  :nationality,
                  :email


  belongs_to              :category
  belongs_to              :user

  has_many                :groups  #, foreign_key: :manager_id
  has_many                :stories
  has_many                :projects
  has_many                :initiatives
  has_many                :images

  has_many                :receivers, as: :receiverable
  has_many                :images,    as: :imageable
  has_many                :stories,   as: :storyable

  has_many                :initiatives, through: :receivers

  has_and_belongs_to_many :sponsorships
  has_and_belongs_to_many :groups

  # has_one    :primary_contact, class_name: "Tenant"

  def avatar
    ActionController::Base.helpers.image_path("avatar-placeholder.jpg")
  end

  def active_sponsors
    result = []
    self.receivers.each do |receiver|
      receiver.sponsorships.each do |sponsorship|
        sponsorship.sponsors.each do |sponsor|
            result << sponsor.full_name
        end
      end
    end
    result
  end

end
