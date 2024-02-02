class UsedMuscle < ApplicationRecord
  belongs_to :exercise
  belongs_to :muscle_group
  #add validations next
end
