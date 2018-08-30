class GenericChecklistsController < ApplicationController
  before_action :set_generic_checklist, only: [:show, :edit, :update, :destroy]

  # GET /generic_checklists
  # GET /generic_checklists.json
  def index
    @generic_checklists = GenericChecklist.all
  end

  # GET /generic_checklists/1
  # GET /generic_checklists/1.json
  def show
  end

  # GET /generic_checklists/new
  def new
    @generic_checklist = GenericChecklist.new
  end

  # GET /generic_checklists/1/edit
  def edit
  end

  # POST /generic_checklists
  # POST /generic_checklists.json
  def create
    @generic_checklist = GenericChecklist.new(generic_checklist_params)

    respond_to do |format|
      if @generic_checklist.save
        format.html { redirect_to @generic_checklist, notice: 'Generic checklist was successfully created.' }
        format.json { render :show, status: :created, location: @generic_checklist }
      else
        format.html { render :new }
        format.json { render json: @generic_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_checklists/1
  # PATCH/PUT /generic_checklists/1.json
  def update
    respond_to do |format|
      if @generic_checklist.update(generic_checklist_params)
        format.html { redirect_to @generic_checklist, notice: 'Generic checklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @generic_checklist }
      else
        format.html { render :edit }
        format.json { render json: @generic_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_list
    @new = GenericListCheck.new(
                                generic_checklist_id: params[:generic_checklist_id],
                                user_id: current_user.id,
                                )
    @new.save!

    respond_to do |format|
      format.js   { render :layout => false }
    end
  end

  # DELETE /generic_checklists/1
  # DELETE /generic_checklists/1.json
  def destroy
    @generic_checklist.destroy

    respond_to do |format|
      format.html { redirect_to generic_checklists_url, notice: 'Generic checklist was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic_checklist
      @generic_checklist = GenericChecklist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_checklist_params
      params.require(:generic_checklist).permit(:title, :description, :site_id, :session_time)
    end
end
