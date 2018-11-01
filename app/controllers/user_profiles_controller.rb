class UserProfilesController < ApplicationController
  def admin
  end

  def manager
  end

  def pool_deck_leader
    @teachers = User.where(teacher: true).all
    @tasks = Task.where(target_user: current_user.id).where(completed: nil).all
    @risk_tasks = Task.where(task_type: "risk").where(completed: nil).all
    @completed_tasks = Task.where(target_user: current_user.id).where(completed: true).all
    @all_tasks = Task.where(completed: [false, nil]).all
    @flags = Flag.where(closed: [false, nil]).all

    #Health Scores
    @start_score = 100
    @all_students = Student.all.count
    @out_flags = Flag.where(closed: [nil, false]).all.count
    @out_tasks = Task.where(completed: [nil, false]).where(task_type: "risk").all.count
    @out_messages = Post
    .where(certificate: [nil, false])
    .where(level_id: [nil, false])
    .where(skill_id: [nil, false])
    .where.not(body: "Welcome to Rackley Swimming")
    .where(actioned: [false, nil])
    .where(note: [nil, false])
    .where.not(user_id: current_user.id)
    .all.count
    @out_comments = Comment.where(acknowleged: [false, nil])
    .where.not(user_id: current_user.id)
    .all.count

    @problems = @out_flags + @out_tasks + @out_messages + @out_comments
    @result = @start_score - ((@problems.round(1) / @all_students.round(1)) * 100).floor / 2

  end

  def teacher
    if params.has_key?(:teacher_search)
      @user = User.where(email: params[:teacher_search]).last
    else
      @user = current_user
    end
    @tasks = Task.where(target_user: @user.id).where(completed: nil).all
    @completed_tasks = Task.where(target_user: @user.id).where(completed: true).all
  end

  def customer_service
  end

  def client
  end

  def complete_task
    @task = Task.find(params[:task_id])
    @task.update_attributes(completed: true)
    redirect_back(fallback_location: user_profiles_teacher_path)
  end 

end
