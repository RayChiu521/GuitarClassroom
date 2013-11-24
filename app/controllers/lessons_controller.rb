class LessonsController < ApplicationController

	# protect_from_forgery :except => :create
	skip_before_action :require_login, :only=>[:create]

	def create
		lesson = Lesson.new(lesson_params)
		lesson.current_user = current_user

		if lesson.save
			respond_to do |format|
				format.html
				format.json { render json: lesson }
			end
		else
			respond_to do |format|
				format.html
				format.json { render json: { status: false,
																		 errors: lesson.errors.full_messages,
																		 model: lesson } }
			end
		end
	end

	def update
	end

	def destroy
	end


	private
		def lesson_params
			params.require(:lesson).permit(:lesson_date, :content, :teacher_id, student_ids: [])
		end

end