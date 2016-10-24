class Hacker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas, dependent: :destroy
  has_many :collaborations, dependent: :destroy

  def create_idea(params)
    Idea.transaction do
      idea = ideas.create(params)
      join idea
      idea
    end
  end

  def join(idea)
    collaborations.create! idea: idea
  end

  def leave(idea)
    collaborations.find_by(idea: idea).delete
  end

  def joined?(idea)
    collaborations.exists? hacker_id: id
  end
end
