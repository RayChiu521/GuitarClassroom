# encoding: utf-8
class Lesson < ActiveRecord::Base

	attr_accessor :current_user

	has_many :arrangements
	has_many :students, through: :arrangements, source: :user, dependent: :destroy

	belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

	has_many :songs, as: :songable

	# validates :lesson_date, presence: true
	validates :teacher, presence: true
	validates :student_ids, presence: true
	validates :current_user, presence: true
	validate :validate_teacher_group, :validate_arrangement_for_others

	before_destroy :validate_arrangement_for_others


	def self.period(beginning = nil, ending = nil)
		beginning = Time.now.beginning_of_month if beginning.nil?
		ending = Time.now.end_of_month if ending.nil?
		where(["(beginning <= ? and beginning >= ?) or (ending <= ? and ending >= ?)",
					 beginning, ending, ending, beginning])
	end

	def calendar_title
		"#{self.teacher.nickname} - #{self.students.map { |s| s.nickname }.join(", ")}"
	end

	def to_json(options={})
		range = {
			include: [
				{ teacher: { only: [:id, :account, :nickname] }},
				{ students: { only: [:id, :account, :nickname] }}
			]
		}
  	super(options.merge(range))
	end

	private

		def validate_teacher_group
			if self.teacher
				errors.add(:teacher, "#{self.teacher.account} isn't a teacher.") unless self.teacher.is_teacher?
			end
	  end

	  def validate_arrangement_for_others
	  	if self.current_user && !self.current_user.id.in?(self.student_ids) && !self.current_user.is_teacher?
				errors.add(:students, "You can't arrangement an lesson for other students.")
				return false
			end
	  end

end