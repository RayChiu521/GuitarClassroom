require "spec_helper"

describe User do
  describe "Authentication" do

  	let!(:user) { build_user(account: "Test Authentication") }
  	let!(:duplicate_user) { build_user(account: "Test Authentication") }
		subject { user }
		subject { duplicate_user }

		it "success" do
			expect { user.save }.to change { User.count }.by(1)
		end

		it "raise error when password is empty" do
			user.password = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when password_confirmation is empty" do
			user.password_confirmation = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when password is not equal to password_confirmation" do
			user.password = user.password_confirmation + "a"
			expect { user.save! }.to raise_error
		end

		it "raise error when account is empty" do
			user.account = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when account duplicate" do
			user.save
			expect { duplicate_user.save! }.to raise_error
		end
	end

	describe "roles" do

		let!(:teacher) { build_teacher_user }
		let!(:student) { build_student_user }
		subject { teacher }
		subject { student }

		it "is_teacher?" do
			teacher.save
			teacher.is_teacher?.should == true
		end

		it "not is_teacher?" do
			student.save
			student.is_teacher?.should_not == true
		end

	end
end