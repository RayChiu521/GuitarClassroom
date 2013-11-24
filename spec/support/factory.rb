
def build_user(attributes={})
  user = User.new({ account: "new_one",
										password: "p@ssw0rd",
								  	password_confirmation: "p@ssw0rd"}.merge(attributes))
end

def build_teacher_user(attributes={})
	attributes = attributes.merge({ account: "Teacher"}) if !attributes.has_key?("account")
	user = build_user(attributes)
	user.groups << Group.teacher
	user
end

def build_student_user(attributes={})
	attributes = attributes.merge({ account: "Student"}) if !attributes.has_key?("account")
	user = build_user(attributes)
	user.groups << Group.student
	user
end


def build_lesson(attributes={})
	teacher = build_teacher_user
	student = build_student_user
	lesson = Lesson.new({ current_user: teacher,
												teacher: teacher,
												students: [student],
												lesson_date: Time.now,
												content: "content"})
end