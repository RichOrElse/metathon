class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :hacker
  has_many :collaborations, dependent: :destroy
  has_many :hackers, through: :collaborations
  has_many :projects, dependent: :destroy
  has_many :hackathons, through: :projects

  enum status: [:New, :Done, :Continue, :Fail]

  def join(hackathon)
    projects.create! hackathon: hackathon
  end

  def leave(hackathon)
    projects.find_by(hackathon: hackathon).delete
  end

  def joined?(hackathon)
    projects.exists? hackathon: hackathon
  end

  def hackers_count
    hackers.size
  end
end
