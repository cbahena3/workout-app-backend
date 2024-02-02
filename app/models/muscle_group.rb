class MuscleGroup < ApplicationRecord
  has_many :used_muscles
  has_many :exercises, through: :used_muscles
  #add validations next
end
