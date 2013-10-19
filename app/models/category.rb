class Category < ActiveRecord::Base

  acts_as_universal

  attr_accessible :name

  has_many   :people

end
