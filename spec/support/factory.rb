
def build_user(attributes={}, groups = [])
  user = User.new({ account: "new_one",
										password: "p@ssw0rd",
								  	password_confirmation: "p@ssw0rd"}.merge(attributes))
  user.groups << groups if !groups.blank?
  user
end

def build_teacher_user(attributes={})
	attributes = attributes.merge({ account: "Teacher"}) if !attributes.has_key?("account")
	user = build_user(attributes, [Group.teacher])
	user
end

def build_student_user(attributes={})
	attributes = attributes.merge({ account: "Student"}) if !attributes.has_key?("account")
	user = build_user(attributes, [Group.student])
	user
end


def build_lesson(attributes={})
	lesson = Lesson.new({ lesson_date: Time.now,
												content: "content"})
end