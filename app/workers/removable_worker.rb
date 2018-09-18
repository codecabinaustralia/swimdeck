class RemovableWorker

  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform()
  	@student_skills = StudentSkill.all
  	@lesson_participants = LessonParticipant.all
  	@client_students = ClientStudent.all
  	@clients = Client.all
  	@students = Student.all
  	@lessons = Lesson.all
    @generic_lists = GenericListCheck.all
	@users = User.where.not(email: "josh@codecabin.com.au").where.not(email: "centenary@rackleyswimming.com.au").all


	@student_skills.destroy_all
	@lesson_participants.destroy_all
	@client_students.destroy_all
	@clients.destroy_all
	@students.destroy_all
	@lessons.destroy_all
  @generic_lists.destroy_all
	@users.destroy_all
  end
end
