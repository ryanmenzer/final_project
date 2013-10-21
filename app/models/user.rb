class User < ActiveRecord::Base
  #Should this be: acts_as_universal_and_determines_tenant
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

 def self.find_for_authentication(conditions={})
     conditions[:account_id] = Account.find_by_subdomain(conditions.delete(:subdomain)).id
     super(conditions)
   end

end
