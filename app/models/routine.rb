class Routine < ApplicationRecord
  belongs_to :user
  has_many :exercises
  #add validations next
end
