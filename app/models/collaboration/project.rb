class Collaboration::Project < ApplicationRecord
  belongs_to :hackathon
  belongs_to :idea
end
