class Exercise < ApplicationRecord
  has_many :used_muscles
  belongs_to :routine
  has_many :muscle_groups, through: :used_muscles
end
