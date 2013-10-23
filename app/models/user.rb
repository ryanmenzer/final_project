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

  def role_symbols
    # [:administrator] if self.role.name == "Administrator"
    # [:worker] if self.role.name == "Worker"
    # [:guest] if self.role.name == "Guest"
    # [:user] if self.role.name == "User"

    if self.role.name == "Administrator"
      [:administrator]
    elsif self.role.name == "Worker"
      [:worker]
    elsif self.role.name == "Guest"
      [:guest]
    elsif self.role.name == "User"
      [:user]
    end  
  end 

end
