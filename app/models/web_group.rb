class WebGroup < ApplicationRecord
  has_many :assignments
  has_many :profiles, :through => :assignments
end
