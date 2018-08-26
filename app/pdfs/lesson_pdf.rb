class LessonPdf < Prawn::Document
	require 'prawn'
	require 'prawn/table'
	require "open-uri"

	def initialize(lesson, skills, lesson_participants)
		super( page_layout: :landscape, page_size: "A4")
		@lesson = lesson
		@skills = skills
		@lesson_participants = lesson_participants
		header
		line_items
	end

	def header
		text "#{@lesson.level.title} Lesson", size: 20, style: :bold
		text "Start Time #{@lesson.start_time.strftime('%d %b %Y')} at #{@lesson.start_time.strftime('%I:%M%p')}", size: 14, style: :bold
	end

	def line_items
		move_down 20
		line_item_rows
		#table line_item_rows, :cell_style => { :size => 9 }
	end

	def line_item_rows
		
		@p_skills = @skills.pluck(:title)
		@participants = @lesson_participants.pluck(:student_id)
		@student_skills = StudentSkill.where(student_id: @participants).all

		@introduced = @student_skills.where(competency_level_id: 1).all
		@progressing = @student_skills.where(competency_level_id: 2).all
		@competent = @student_skills.where(competency_level_id: 3).all

		@lesson_participants.each do |participant|
			student_skills = StudentSkill.where(student_id: participant.student_id).all

			move_down 10
			fill_color '000000'
			text "#{participant.student.full_name}", size: 10, style: :bold
			move_down 10
			student_skills.each do |student_skill|
				if student_skill.competency_level_id == 1
					@status = "Introduced"
				elsif student_skill.competency_level_id == 2
					@status = "Progressing"
				elsif student_skill.competency_level_id == 3
					@status = "Compentant"
				end

				fill_color '000000'
				text "#{student_skill.skill.title}", size: 9

				

				move_down 5

					if student_skill.competency_level_id == 1
						 fill_color 'E6323D'	
						 fill_rectangle [500, y - 17], 10, 10
						
					else
						 stroke_color '000000'
						 stroke_rectangle [500, y - 17], 10, 10
					end

					if student_skill.competency_level_id == 2
						 fill_color 'F8A113'	
						 fill_rectangle [550, y - 17], 10, 10
						
					else
						stroke_color '000000'
						 stroke_rectangle [550, y - 17], 10, 10
					end
					if student_skill.competency_level_id == 3
						 fill_color '39ba82'	
						 fill_rectangle [600, y - 17], 10, 10
						
					else
						 stroke_color '000000'
						 stroke_rectangle [600, y - 17], 10, 10
					end

		
					stroke_color 'aaaaaa'
					stroke_line [0, y - 32], [700, y - 28]
					

			end
			
		end
		
	end

end