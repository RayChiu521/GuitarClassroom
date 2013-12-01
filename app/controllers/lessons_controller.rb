class LessonsController < ApplicationController

	# protect_from_forgery :except => [:index, :create, :update, :destroy]
	# skip_before_action :require_login, :only=>[:index, :create, :update, :destroy]
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]

	def index
		if is_admin?
			@lessons = Lesson.period(params[:beginning], params[:endding])
		elsif is_teacher?
			@lessons = current_user.teachings.period(params[:beginning], params[:endding])
		else
			@lessons = current_user.lessons.period(params[:beginning], params[:endding])
		end

		respond_to do |format|
			format.html
			format.json { render json: @lessons.to_json(methods: :calendar_title) }
		end
	end

	def show
		respond_to do |format|
			format.html
			format.json { render json: @lesson }
		end
	end

	def new
		@lesson = Lesson.new(beginning: params[:beginning], ending: params[:ending])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.current_user = current_user

		if @lesson.save
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson }
				format.js
			end
		else
			respond_to do |format|
				format.html { render :new }
				format.json { render json: render_failure_by_json }
				format.js
			end
		end
	end

	def edit
		respond_to do |format|
			format.html
			format.js { render :new }
		end
	end

	def update
		if @lesson.update(lesson_params)
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson }
				format.js
			end
		else
			respond_to do |format|
				format.html { render :edit }
				format.json { render json: render_failure_by_json }
				format.js
			end
		end
	end

	def destroy
		if @lesson.destroy
			respond_to do |format|
				format.html { redirect_to :index }
				format.json { render json: @lesson}
				format.js
			end
		else
			respond_to do |format|
				format.html { redirect_to :back }
				format.json { render json: render_failure_by_json }
				format.js
			end
		end
	end


	private
		def set_lesson
			@lesson = Lesson.find(params[:id])
			@lesson.current_user = current_user
		end

		def lesson_params
			params.require(:lesson)
						.permit(:beginning,
										:ending,
										:payment,
										:content,
										:teacher_id,
										student_ids: [],
										song_ids: [])
		end

		def render_failure_by_json
			{
				status: false,
				errors: @lesson.errors.full_messages,
				model: @lesson
			}
		end

end