
def build_user(attributes={})
  user = User.new({ account: "new_one",
										password: "p@ssw0rd",
								  	password_confirmation: "p@ssw0rd"}.merge(attributes))
end

def build_teacher_user(attributes={})
	user = build_user(attributes)
	user.groups << Group.teacher
	user
end

def build_student_user(attributes={})
	user = build_user(attributes)
	user.groups << Group.student
	user
end