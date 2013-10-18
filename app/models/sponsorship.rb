class Sponsorship < ActiveRecord::Base

  belongs_to :tenant
  belongs_to :frequency
  belongs_to :initiative
  belongs_to :sponsor, class_name: "User"
  has_many :transactions
  has_and_belongs_to_many :receivers
  has_and_belongs_to_many :users

end
