class Collaboration < ApplicationRecord
  belongs_to :idea
  belongs_to :hacker
  belongs_to :project
  has_one :hackathon, through: :project
end
