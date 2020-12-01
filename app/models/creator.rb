class Creator < ApplicationRecord

    has_many :projects
    has_many :artists, through: :projects
end
