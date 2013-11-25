require 'spec_helper'

describe Lesson do
	describe "validations" do

		let!(:teacher) { build_teacher_user(account: "Teacher") }
		let!(:student1) { build_student_user(account: "Student1") }
		let!(:student2) { build_student_user(account: "Student2") }
		let!(:lesson) { build_lesson }
		subject { teacher }
		subject { student1 }
		subject { student2 }
		subject { lesson }

		it "invalid when current_user is nil" do
			lesson.current_user = nil
			lesson.save
			lesson.valid?.should_not == true
		end

		it "invalid when teacher is blank" do
			lesson.teacher = nil
			lesson.save
			lesson.valid?.should_not == true
		end

		it "invalid when students is empty" do
			lesson.students = []
			lesson.save
			lesson.valid?.should_not == true
		end

		it "invalid when teacher's group isn't the teacher" do
			lesson.teacher = student1
			lesson.save
			lesson.valid?.should_not == true
		end

		it "invalid when a student arrangement a lesson for another student" do
			lesson.current_user = student1
			lesson.students = [student2]
			lesson.save
			lesson.valid?.should_not == true
		end

		it "successful save" do
			teacher.save
			student1.save
			lesson.current_user = teacher
			lesson.teacher = teacher
			lesson.students = [student1]
			lesson.save
			lesson.valid?.should == true
		end

		it "successful destroy" do
			teacher.save
			student1.save
			lesson.current_user = teacher
			lesson.teacher = teacher
			lesson.students = [student1]
			lesson.save
			lesson.destroy
			Lesson.all.size.should == 0
		end
	end
end