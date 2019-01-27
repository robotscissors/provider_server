class Profile < ApplicationRecord

  has_many :assignments
  has_many :web_groups, :through => :assignments

end
