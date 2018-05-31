class Review < ApplicationRecord
  belongs_to :user
  # ratyrate_rateable 'visual_effects'
  validates_presence_of :rating
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
end
