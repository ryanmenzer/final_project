require 'searchable'

class Person < ActiveRecord::Base

  include Searchable

  after_create do
    make_searchable :full_name, :email
  end

  before_destroy do
    destroy_search
  end

  before_update do
    update_search :full_name, :email
  end

  acts_as_tenant

  before_save :set_full_name

  attr_accessible :category_id,
                  :user_id,
                  :full_name,
                  :first_name,
                  :email,
                  :last_name,
                  :gender,
                  :date_of_birth,
                  :algolia_id,
                  :phone_number,
                  :nationality,
                  :email,
                  :profile_picture_id


  belongs_to              :category
  belongs_to              :user
  belongs_to              :profile_picture, class_name: "Image"

  has_many                :groups  #, foreign_key: :manager_id
  has_many                :stories #, foreign_key: :author_id
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

  def age
    if self.date_of_birth
      Date.today.strftime.to_i - self.date_of_birth.strftime.to_i
    end
  end


  def avatar
    if self.profile_picture_id
      self.profile_picture.url.avatar
    else
      ActionController::Base.helpers.image_path("avatar-placeholder.jpg")
    end
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

  def in_initiative?(initiative)
    self.initiatives.include?(initiative)
  end

  def set_full_name
    self.full_name = "#{first_name} #{last_name}"
  end

end
