class HackathonsController < ApplicationController
  before_action :authenticate_hacker!, except: [:index, :show]
  before_action :set_hackathon, only: [:show, :edit, :update, :destroy, :join, :leave]
  before_action :authorizer_hacker!, only: [:update, :destroy]
  before_action :set_idea, only: [:join, :leave]

  # GET /hackathons
  # GET /hackathons.json
  def index
    @hackathons = Hackathon.order(start_date: :desc)
  end

  # GET /hackathons/1
  # GET /hackathons/1.json
  def show
  end

  # GET /hackathons/new
  def new
    @hackathon = Hackathon.new
  end

  # GET /hackathons/1/edit
  def edit
  end

  # POST /hackathons
  # POST /hackathons.json
  def create
    @hackathon = Hackathon.new(hackathon_params)

    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render :show, status: :created, location: @hackathon }
      else
        format.html { render :new }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hackathons/1
  # PATCH/PUT /hackathons/1.json
  def update
    respond_to do |format|
      if @hackathon.update(hackathon_params)
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { render :show, status: :ok, location: @hackathon }
      else
        format.html { render :edit }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackathons/1
  # DELETE /hackathons/1.json
  def destroy
    @hackathon.destroy
    respond_to do |format|
      format.html { redirect_to hackathons_url, notice: 'Hackathon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @idea.join @hackathon
    redirect_to @idea, notice: 'Hackathon was successfully joined.' 
  end

  def leave
    @idea.leave @hackathon 
    redirect_to @idea, notice: 'Hackathon was successfully left.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hackathon
      @hackathon = Hackathon.find(params[:id])
    end

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def authorizer_hacker!
      @hackathon.hacker == current_hacker
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hackathon_params
      params.require(:hackathon).permit(:title, :start_date, :end_date)
    end
end
