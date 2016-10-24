class IdeasController < ApplicationController
  before_action :authenticate_hacker!
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :join, :leave]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all.decorate
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @hackathons = @idea.hacker == current_hacker ? Hackathon.all : []
  end

  # GET /ideas/new
  def new
    @idea = Idea.new(hacker: current_hacker)
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_hacker.create_idea idea_params

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    current_hacker.join @idea 
    redirect_to @idea, notice: 'Idea was successfully joined.' 
  end

  def leave
    current_hacker.leave @idea 
    redirect_to @idea, notice: 'Idea was successfully left.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:category_id, :hacker_id, :status, :progress, :title, :description, :specialties)
    end
end
