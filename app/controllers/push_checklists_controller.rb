class PushChecklistsController < ApplicationController
  before_action :set_push_checklist, only: [:show, :edit, :update, :destroy]

  # GET /push_checklists
  # GET /push_checklists.json
  def index
    @push_checklists = PushChecklist.all
  end

  # GET /push_checklists/1
  # GET /push_checklists/1.json
  def show
  end

  # GET /push_checklists/new
  def new
    @push_checklist = PushChecklist.new
  end

  # GET /push_checklists/1/edit
  def edit
  end

  # POST /push_checklists
  # POST /push_checklists.json
  def create
    @push_checklist = PushChecklist.new(push_checklist_params)

    respond_to do |format|
      if @push_checklist.save
        format.html { redirect_to @push_checklist, notice: 'Push checklist was successfully created.' }
        format.json { render :show, status: :created, location: @push_checklist }
      else
        format.html { render :new }
        format.json { render json: @push_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_checklists/1
  # PATCH/PUT /push_checklists/1.json
  def update
    respond_to do |format|
      if @push_checklist.update(push_checklist_params)
        format.html { redirect_to @push_checklist, notice: 'Push checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @push_checklist }
      else
        format.html { render :edit }
        format.json { render json: @push_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_checklists/1
  # DELETE /push_checklists/1.json
  def destroy
    @push_checklist.destroy
    respond_to do |format|
      format.html { redirect_to push_checklists_url, notice: 'Push checklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_push_checklist
      @push_checklist = PushChecklist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def push_checklist_params
      params.require(:push_checklist).permit(:title, :description, :manager_id, :user_id, :site_id, :date_issued, :completed)
    end
end
