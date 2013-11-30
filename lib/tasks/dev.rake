# encoding: utf-8
namespace :dev do

	desc 'Rebuild system'
	task :rebuild => ['db:drop', 'db:create', 'db:migrate', 'db:seed']

	desc 'Set up fake data'
	task :fake => :environment do

    puts "Create a teacher."
    Group.teacher.users.create(account: 't', nickname: 'Teacher', password: 'pw', password_confirmation: 'pw')

    puts "Create 10 students"
    1.upto(10) do |n|
    	Group.student.users.create(account: "s#{n}", nickname: "Student#{n}", password: 'pw', password_confirmation: 'pw')
    end
	end
end