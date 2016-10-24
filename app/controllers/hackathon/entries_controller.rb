class Hackathon::EntriesController < ApplicationController
  before_action :authenticate_hacker!
  before_action :set_hackathon
  before_action :set_idea, only: [:join, :leave]

  def create
    @idea.join @hackathon
    redirect_to @idea, notice: 'Hackathon was successfully joined.' 
  end

  def destroy
    @idea.leave @hackathon 
    redirect_to @idea, notice: 'Hackathon was successfully left.' 
  end
end