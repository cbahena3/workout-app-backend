class Exercise < ApplicationRecord
  has_many :used_muscles
  has_many :muscle_groups, through: :used_muscles
  has_many :exercise_routines
  has_many :routines, through: :exercise_routines
  #add validations next
end
