class CompetencyLevelsController < ApplicationController
  before_action :set_competency_level, only: [:show, :edit, :update, :destroy]

  # GET /competency_levels
  # GET /competency_levels.json
  def index
    @competency_levels = CompetencyLevel.all
  end

  # GET /competency_levels/1
  # GET /competency_levels/1.json
  def show
  end

  # GET /competency_levels/new
  def new
    @competency_level = CompetencyLevel.new
  end

  # GET /competency_levels/1/edit
  def edit
  end

  # POST /competency_levels
  # POST /competency_levels.json
  def create
    @competency_level = CompetencyLevel.new(competency_level_params)

    respond_to do |format|
      if @competency_level.save
        format.html { redirect_to @competency_level, notice: 'Competency level was successfully created.' }
        format.json { render :show, status: :created, location: @competency_level }
      else
        format.html { render :new }
        format.json { render json: @competency_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competency_levels/1
  # PATCH/PUT /competency_levels/1.json
  def update
    respond_to do |format|
      if @competency_level.update(competency_level_params)
        format.html { redirect_to @competency_level, notice: 'Competency level was successfully updated.' }
        format.json { render :show, status: :ok, location: @competency_level }
      else
        format.html { render :edit }
        format.json { render json: @competency_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competency_levels/1
  # DELETE /competency_levels/1.json
  def destroy
    @competency_level.destroy
    respond_to do |format|
      format.html { redirect_to competency_levels_url, notice: 'Competency level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency_level
      @competency_level = CompetencyLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_level_params
      params.require(:competency_level).permit(:title, :color)
    end
end
