class PlannerController < ApplicationController
  def daily_planner
  	#%Y-%m-%d %H:%M:%S

  	if params.has_key?(:site)
  		@site = Site.find(params[:site])
  	else
  		@site = 1
  	end

  	if params.has_key?(:filter_time)
  		@filter_time = params[:filter_time].to_date
  	else
  		@filter_time = Time.now
  	end

    

  	@lessons = Lesson.where("start_time >= ?", @filter_time).where("start_time < ?", @filter_time.to_date + 1.day).all.order(:start_time).paginate(:page => params[:page], :per_page => 30)
    @checked_lists = GenericListCheck.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all.pluck(:generic_checklist_id)
  	@generic_checklists = GenericChecklist.where.not(id: @checked_lists).all
  	@push_checklists = PushChecklist.where(site_id: @site).all

    @date_today = Time.now.strftime("%Y-%m-%d")
    @task_flags = Task.where(target_user: current_user.id).where(due_date: @date_today).where(completed: [false, nil]).all
    

  	end
end
