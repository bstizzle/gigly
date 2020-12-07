class Review < ApplicationRecord
  belongs_to :artist
  belongs_to :creator
end
