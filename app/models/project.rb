class Project < ApplicationRecord
  belongs_to :hackathon
  belongs_to :idea
  has_many :collaborations, dependent: :nullify
end
