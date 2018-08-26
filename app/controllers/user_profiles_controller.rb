class UserProfilesController < ApplicationController
  def admin
  end

  def manager
  end

  def pool_deck_leader
    @teachers = User.where(teacher: true).all
    @tasks = Task.where(target_user: current_user.id).where(completed: nil).all
    @completed_tasks = Task.where(target_user: current_user.id).where(completed: true).all
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
