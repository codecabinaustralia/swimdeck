class PlannerController < ApplicationController
  def daily_planner
  	#%Y-%m-%d %H:%M:%S

  	if params.has_key?(:site)
  		@site = Site.find(params[:site])
  	else
  		@site = 1
  	end

  	if params.has_key?(:filter_time)
  		@filter_time = params[:filter_time].to_date.strftime('%d %b %Y')
  	else
  		@filter_time = Time.now.strftime('%d %b %Y')
  	end

    Time.now.strftime('%d %b %Y').to_s > @lesson.StuBookStartDate
  	@lessons = Lesson.where(lesson_day: @filter_time.strftime('%A').to_s).where("lesson_date > ?", @filter_time).all.order(:lesson_time).paginate(:page => params[:page], :per_page => 30)
    

    @checked_lists = GenericListCheck.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all.pluck(:generic_checklist_id)
  	
    @generic_checklists_am_pres = GenericChecklist.where(session_time: "am").where(title: "Pre").where.not(id: @checked_lists).all
    @generic_checklists_am_posts = GenericChecklist.where(session_time: "am").where(title: "Post").where.not(id: @checked_lists).all
    @generic_checklists_pm_pres = GenericChecklist.where(session_time: "pm").where(title: "Pre").where.not(id: @checked_lists).all
    @generic_checklists_pm_posts = GenericChecklist.where(session_time: "pm").where(title: "Post").where.not(id: @checked_lists).all
  	
    @push_checklists = PushChecklist.where(site_id: @site).all

    @date_today = Time.now.strftime("%Y-%m-%d")
    @task_flags = Task.where(target_user: current_user.id).where(due_date: @date_today).where(completed: [false, nil]).all
    @other_tasks = Task.where(due_date: @date_today).where(completed: [false, nil]).all

  	end
end

