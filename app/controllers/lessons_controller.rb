class LessonsController < ApplicationController

	# protect_from_forgery :except => [:create, :update, :destroy]
	# skip_before_action :require_login, :only=>[:create, :update, :destroy]
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.current_user = current_user

		if @lesson.save
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson }
			end
		else
			respond_to do |format|
				format.html { render :new }
				format.json { render json: render_failure_by_json }
			end
		end
	end

	def edit
	end

	def update
		if @lesson.update(lesson_params)
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson }
			end
		else
			respond_to do |format|
				format.html { render :edit }
				format.json { render json: render_failure_by_json }
			end
		end
	end

	def destroy
		if @lesson.destroy
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson}
			end
		else
			respond_to do |format|
				format.html { redirect_to :back }
				format.json { render json: render_failure_by_json }
			end
		end
	end


	private
		def set_lesson
			@lesson = Lesson.find(params[:id])
			@lesson.current_user = current_user
		end

		def lesson_params
			params.require(:lesson).permit(:lesson_date, :content, :teacher_id, student_ids: [])
		end

		def render_failure_by_json
			{
				status: false,
				errors: @lesson.errors.full_messages,
				model: @lesson
			}
		end

end