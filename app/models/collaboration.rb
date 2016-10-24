class Collaboration < ApplicationRecord
  belongs_to :idea
  belongs_to :hacker
  belongs_to :project, required: false
  has_one :hackathon, through: :project
end
