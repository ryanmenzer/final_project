class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  #acts_as_universal_and_determines_account

  belongs_to :role
  belongs_to :category

  has_many   :groups
  has_many   :stories
  has_many   :projects
  has_and_belongs_to_many :sponsorships
  has_and_belongs_to_many :groups

  has_many   :receivers, as: :receiverable
  has_many   :images, as: :imageable
  has_many   :stories, as: :storyable

end
