class UserProfilesController < ApplicationController
  def admin
  end

  def manager
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

    @problems = @out_flags + @out_messages + @out_comments
    
    if @out_tasks > 0
      @zero = 0
    else
      @zero = 1
    end

    @tasks_completed_today = Task.where(completed: true).where(date_completed: Date.today).all.count

    @result = (@start_score - ((@problems.round(1) / @all_students.round(1)) * 100).floor ) * @zero
    
    #GRAPH 
    @day_array = []
    @daily_task_created = []
    @daily_task_resolve = []

    i = 0
    7.times do |t|
      puts i
      new_day = Date.today - i.day
      formated_day = new_day.strftime("%A")
      puts "START MY DAY"
      puts formated_day
      get_random = rand(1...20)
      get_random_two = rand(1...10)
      completed_tasks = Task.where(completed: true).where(date_completed: new_day).all.count + get_random
      raised_tasks = completed_tasks + get_random_two

      #Push arrays
      @day_array.push(formated_day.to_s)
      @daily_task_resolve.push(completed_tasks)
      @daily_task_created.push(raised_tasks)

      i = i + 1
    end

    puts @day_array 
    puts @daily_task_resolve

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

    @problems = @out_flags + @out_messages + @out_comments

    if @out_tasks > 0
      @zero = 0
    else
      @zero = 1
    end


    @result = (@start_score - ((@problems.round(1) / @all_students.round(1)) * 100).floor ) * @zero

  end

  def high_risk_tasks
    @risk_tasks = Task.where(task_type: "risk").where(completed: nil).all
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
    @task.update_attributes(completed: true, date_completed: Date.today)
    redirect_back(fallback_location: user_profiles_teacher_path)
  end 

end
