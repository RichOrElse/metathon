class Hackathon < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :ideas, through: :projects

  scope :ongoing, -> { Hackathon.where('end_date <= ?', Date.current) }

  def ideas_count
    projects.size
  end
end
