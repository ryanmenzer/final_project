class User < ActiveRecord::Base

  acts_as_universal_and_determines_account

  belongs_to :role
  has_one    :primary_contact, class_name: "Setting"
  has_one    :person

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :role_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
