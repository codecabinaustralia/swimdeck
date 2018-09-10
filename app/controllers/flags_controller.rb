class FlagsController < ApplicationController
  before_action :set_flag, only: [:show, :edit, :update, :destroy]

  def feed_me
    @clients = Client.all

    if @parent_info_flag == true
      @clients.each do |client|
        if client.get_to_know.blank?
          @client_students = ClientStudent.where(client_id: client.id).all
          @students = Student.where(id: @client_students.pluck(:student_id))
          @students.each do |student|
            @flag = Flag.new(
              title: "We need to know more information about the guardian: #{client.first_name}, try to fill out their details.",
              student_id: student.id,
              compulsory_note: true,
              flag_type: "client_information"
              )
            @flag.save
          end
        end
      end
    end


    if @no_skill_achieved_flag == true
       @students = Student.all
       @one_month = Time.now - 30.days

        @students.each do |student|
        @last_post = Post.where(student_id: student.id).where(note: nil).where.not(skill_id: nil).last
         
         if @last_post.present?
           if @last_post.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
             @task = Task.new(
               title: "#{student.full_name} hasn't mastered a skill for a while and is at risk of dropping off.",
               student_id: student.id,
               due_date: Time.now,
               task_type: "risk"
               )
             @task.save
           end
         else
           if student.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
             @task = Task.new(
               title: "#{student.full_name} hasn't mastered any skills yet and is at risk of dropping off.",
               student_id: student.id,
               due_date: Time.now,
               task_type: "risk"
               )
             @task.save
           end
         end
      end
    end

    if @no_wall_activity_flag == true
      @students = Student.all
      @one_month = Time.now - 30.days
      puts @one_month.strftime("%Y-%m-%d")

      @students.each do |student|
        @last_post = Post.where(student_id: student.id).where(note: nil).last
        if @last_post.present?
          puts @last_post.created_at.strftime("%Y-%m-%d")
          if @last_post.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
            @task = Task.new(
              title: "#{student.full_name} is at risk of dropping off. Please review their wall and make contact.",
              student_id: student.id,
              due_date: Time.now,
              task_type: "risk"
              )
            @task.save
          end
        end
      end
    end
    
    @students = Student.all

    @students.each do |student|
      @current_year = Date.today.strftime("%Y").to_s
      @current_birthday = @current_year + student.dob.strftime("-%m-%d").to_s
      @current_birthday = @current_birthday.to_date
      @birthday = Date.today - @current_birthday
      @birthday = @birthday.floor

      #Create flag 6 weeks before
      if @birthday == -42
        @flag = Flag.new(
          title: "#{student.full_name} has a birthday on the #{student.dob.strftime('%d/%m')}. If it's not too late. Please talk to parents about booking in a birthday party",
          student_id: student.id,
          compulsory_note: true,
          flag_type: "birthday"
          )
        @flag.save
      end

      #Create flag 1 weeks before
      if @birthday == -7
        @flag = Flag.new(
          title: "#{student.full_name} has a birthday on the #{student.dob.strftime('%d/%m')}. Don't forget to wish them a happy birthday!",
          student_id: student.id,
          compulsory_note: true,
          flag_type: "birthday"
          )
        @flag.save
      end
    
      #Delete flags if birthday has past
      if @birthday > 0
        @flags = Flag.where(student_id: student.id).where(flag_type: 'birthday').where(closed: [false, nil]).all
        @flags.each do |flag|
          flag.update_attributes(
            note: "Not completed by actual birthday - closed by system",
            closed: true
            )
        end
      end
    end

    redirect_to root_path
  end

  def client_details
    @clients = Client.all

    @clients.each do |client|
      if client.get_to_know.blank?
        @client_students = ClientStudent.where(client_id: client.id).all
        @students = Student.where(id: @client_students.pluck(:student_id))
        @students.each do |student|
          @flag = Flag.new(
            title: "We need to know more information about the guardian: #{client.first_name}, try to fill out their details.",
            student_id: student.id,
            compulsory_note: true,
            flag_type: "client_information"
            )
          @flag.save
        end
      end
    end

  end

  def skill_inactivity
    @students = Student.all
    @one_month = Time.now - 30.days

    @students.each do |student|
      @last_post = Post.where(student_id: student.id).where(note: nil).where.not(skill_id: nil).last
      
      if @last_post.present?
        if @last_post.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
          @task = Task.new(
            title: "#{student.full_name} hasn't mastered a skill for a while and is at risk of dropping off.",
            student_id: student.id,
            due_date: Time.now,
            task_type: "risk"
            )
          @task.save
        end

      else
        if student.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
          @task = Task.new(
            title: "#{student.full_name} hasn't mastered any skills yet and is at risk of dropping off.",
            student_id: student.id,
            due_date: Time.now,
            task_type: "risk"
            )
          @task.save
        end
      end


   end
  end

  def wall_inactivity
    @students = Student.all
    @one_month = Time.now - 30.days
    puts @one_month.strftime("%Y-%m-%d")

    @students.each do |student|
      @last_post = Post.where(student_id: student.id).where(note: nil).last
      if @last_post.present?
        puts @last_post.created_at.strftime("%Y-%m-%d")
        if @last_post.created_at.strftime("%Y-%m-%d") == @one_month.strftime("%Y-%m-%d")
          @task = Task.new(
            title: "#{student.full_name} is at risk of dropping off. Please review their wall and make contact.",
            student_id: student.id,
            due_date: Time.now,
            task_type: "risk"
            )
          @task.save
        end
      end

    end

  end

  def birthdays
    @students = Student.all

    @students.each do |student|
      @current_year = Date.today.strftime("%Y").to_s
      @current_birthday = @current_year + student.dob.strftime("-%m-%d").to_s
      @current_birthday = @current_birthday.to_date
      @birthday = Date.today - @current_birthday
      @birthday = @birthday.floor

      #Create flag 6 weeks before
      if @birthday == -42
        @flag = Flag.new(
          title: "#{student.full_name} has a birthday on the #{student.dob.strftime('%d/%m')}. If it's not too late. Please talk to parents about booking in a birthday party",
          student_id: student.id,
          compulsory_note: true,
          flag_type: "birthday"
          )
        @flag.save
      end

      #Create flag 1 weeks before
      if @birthday == -7
        @flag = Flag.new(
          title: "#{student.full_name} has a birthday on the #{student.dob.strftime('%d/%m')}. Don't forget to wish them a happy birthday!",
          student_id: student.id,
          compulsory_note: true,
          flag_type: "birthday"
          )
        @flag.save
      end
    
      #Delete flags if birthday has past
      if @birthday > 0
        @flags = Flag.where(student_id: student.id).where(flag_type: 'birthday').where(closed: [false, nil]).all
        @flags.each do |flag|
          flag.update_attributes(
            note: "Not completed by actual birthday - closed by system",
            closed: true
            )
        end
      end



    end 



  end

  # GET /flags
  # GET /flags.json
  def index
    @flags = Flag.all
  end

  # GET /flags/1
  # GET /flags/1.json
  def show
  end

  # GET /flags/new
  def new
    @flag = Flag.new
  end

  # GET /flags/1/edit
  def edit
  end

  # POST /flags
  # POST /flags.json
  def create
    @flag = Flag.new(flag_params)

    respond_to do |format|
      if @flag.save
        format.html { redirect_to @flag, notice: 'Flag was successfully created.' }
        format.json { render :show, status: :created, location: @flag }
      else
        format.html { render :new }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flags/1
  # PATCH/PUT /flags/1.json
  def update
    respond_to do |format|
      if @flag.update(flag_params)
        format.html { redirect_back(fallback_location: daily_planner_path)}
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /flags/1
  # DELETE /flags/1.json
  def destroy
    @flag.destroy
    respond_to do |format|
      format.html { redirect_to flags_url, notice: 'Flag was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flag_params
      params.require(:flag).permit(:title, :number_of_days, :closed, :note)
    end
end
