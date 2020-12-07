class Review < ApplicationRecord
  belongs_to :artist
  belongs_to :creator

  validates_presence_of :rating
  validates :rating, :inclusion => 1..5

end
