class Person < ActiveRecord::Base

  acts_as_tenant

  attr_accessible :category_id,
                  :user_id,
                  :full_name,
                  :first_name,
                  :last_name,
                  :gender,
                  :date_of_birth,
                  :phone_number,
                  :nationality


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

  has_and_belongs_to_many :sponsorships
  has_and_belongs_to_many :groups

  # has_one    :primary_contact, class_name: "Tenant"

end