
def build_user(attributes={})
  user = User.new({ account: "new_one",
										password: "p@ssw0rd",
								  	password_confirmation: "p@ssw0rd"}.merge(attributes))
end