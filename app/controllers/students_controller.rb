class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
protect_from_forgery with: :exception, prepend: true
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if @student.current_level.present?
      @student_level = Level.find(@student.current_level)
    end

    # Find if client has multiple students
    @last_student = ClientStudent.where(student_id: @student.id).last
    @multiple_students = ClientStudent.where(client_id: @last_student.client_id).all
    if @multiple_students.count > 1
      @multiple = true
    end
    @get_students = @multiple_students.pluck(:student_id)
    @students = Student.where(id: @get_students).all

    if params.has_key?(:show_multiple)
      if current_user.client == true
        @posts = Post.where(student_id: @get_students).where(note: [false, nil]).order("created_at DESC").all
      else
        @posts = Post.where(student_id: @get_students).order("created_at DESC").all
      end
    else
      if current_user.client == true
        @posts = Post.where(student_id: @student.id).where(note: [false, nil]).order("created_at DESC").all
      else
        @posts = Post.where(student_id: @student.id).order("created_at DESC").all
      end
    end
    ####

    @student_skills = StudentSkill.where(student_id: @student.id).all
    @clients = ClientStudent.where(student_id: @student.id).all

  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_student_skills
    



    @student_skill = StudentSkill.find(studentskill_params[:skill_id])                          
    @student_skill.update_attributes(
      competency_level_id: studentskill_params[:competency_level_id]
      )

    #Add skill post
    if @student_skill.competency_level_id == 3
      @post = Post.new(
                skill_id: @student_skill.id,
                student_id: @student_skill.student_id,
                user_id: current_user.id,
                body: "Congratulations you have mastered a new skill"
                )
      @post.save!



      require 'twilio-ruby'

      # put your own credentials here
      account_sid = 'AC6b4358589e13ef900a8207150b496beb'
      auth_token = '9f717bdcb708890ee2bb02cb11cf8716'

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new account_sid, auth_token

      @student = Student.find(@student_skill.student_id)
      @student_lesson = LessonParticipant.where(student_id: @student.id).last
      @latest_lesson = Lesson.find(@student_lesson.lesson_id)
      @teacher = User.find(@latest_lesson.user_id)

      @myclient = ClientStudent.where(student_id: @student.id).last

      if @activate_parent_sms == true
        @client.api.account.messages.create(
          from: '+61488810959',
          to: "#{@myclient.client.phone_1}",
          body: "Hi it's #{@teacher.first_name} from Rackley Swimming, just writing to say congratulations to #{@student.first_name} who has mastered a new skill - #{@student_skill.skill.title}. It won't be long until #{@student.first_name} moves to the next level! If you haven't already booked your next lesson simply reply to this message with your best time and I can book it in for you. Yours kindly, #{@teacher.full_name}"
        )
      end

      #Add congratulations flag
      if @new_skill_achieved_flag == true
      @flag = Flag.new(
              title: "Congratulate #{@student_skill.student.full_name} for becoming compentant in #{@student_skill.skill.title}.",
              student_id: @student_skill.student_id,
              flag_type: 'gratitude',
              compulsory_note: true,

        )
      @flag.save
      end

      @tasks = Task.where(student_id: @student_skill.student_id).where(task_type: 'risk').where(completed: [nil, false]).all
      @tasks.each do |task|
          task.update_attributes(
            completed: true,
            note: 'Closed by system: Skill was updated after 30 days.'
            )
        end

    end

    #Flag
    @last_competency = CompetencyLevel.last
    @competency_skills = StudentSkill.where(student_id: @student_skill.student_id).where(competency_level_id: @last_competency.id).all
    @student_skills = StudentSkill.where(student_id: @student_skill.student_id).all
    if @student_skills.count == @competency_skills.count
      if @ready_for_assesment_flag == true
        @flag = Flag.new(
                title: "#{@student_skill.student.full_name} is ready for evaluation",
                student_id: @student_skill.student_id,
                flag_type: 'evaluation',
                compulsory_note: true,

          )
        @flag.save
      end
    end

    #Redirect
    respond_to do |format|
      format.html { redirect_back(fallback_location: student_path(params[:student_id]))  }
      format.json { head :no_content }
      format.js   { render :layout => false, format: :js }
    end

    
  end

  def bulk_update_skills
    @lesson = Lesson.find(params[:lesson_id])
    @skill = params[:skill_id]
    @new_competency_level = CompetencyLevel.where(title: params[:new_competency_level]).last

    @lesson_participants = LessonParticipant.where(lesson_id: @lesson.id).all

    @lesson_participants.each do |lesson_participant|
      @studentskills = StudentSkill.where(student_id: lesson_participant.student_id).where(skill_id: @skill).all
      @studentskills.each do |student_skill|
        if student_skill.competency_level_id != @new_competency_level.id 
          student_skill.update_attributes(competency_level_id: @new_competency_level.id)
          #Flag
          @last_competency = CompetencyLevel.last
          @competency_skills = StudentSkill.where(student_id: student_skill.student_id).where(competency_level_id: @last_competency.id).all
          #Find All Student Skills
          @all_student_skills = StudentSkill.where(student_id: student_skill.student_id).all

          if @all_student_skills.count == @competency_skills.count
            @flag = Flag.new(
                    title: "#{student_skill.student.full_name} is ready for evaluation",
                    student_id: student_skill.student_id,
                    flag_type: 'evaluation',
                    compulsory_note: true
              )
            @flag.save
          end
        end

      end
    end

    redirect_back(fallback_location: lesson_path(params[:lesson_id])) 
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    #Identify current level before being saved
    @old_level = @student.current_level
    
    respond_to do |format|

      if @student.update(student_params)

        #When saved, if current_level is different to the new current level
        if params[:current_level] != @old_level
          @skills = Skill.where(level_id: @student.current_level).all
          @student_skills = StudentSkill.where(student_id: @student).all
          #Delete all student_skills
          @student_skills.destroy_all
          #Add all skills for new level
          @skills.each do |skill|
            @student_skill = StudentSkill.new(
                              student_id: @student.id,
                              skill_id: skill.id,
                              level_id: skill.level_id,
                              competency_level_id: 1)
            @student_skill.save
            @student.update_attributes(competent_but_waiting: true)
          end

          @new_level = Level.find(@student.current_level)
          #Add certificate post to timeline
          @certificate = Post.new(
                            student_id: @student.id,
                            user_id: current_user.id,
                            body: "you graduated to #{@new_level.title}!",
                            certificate: true,
                            level_id: @new_level.id
                          )
          @certificate.save!
        end

        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:avatar, :first_name, :last_name, :dob, :personal_notes, :current_level)
    end

    def studentskill_params
      params.require(:student_skill).permit(:competency_level_id, :skill_id)
    end
end
