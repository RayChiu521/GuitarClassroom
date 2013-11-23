# encoding: utf-8
namespace :dev do

	desc 'Rebuild system'
	task :rebuild => ['db:drop', 'db:create', 'db:migrate', 'db:seed']

	desc 'Set up fake data'
	task :fake => :environment do

    puts "Create a teacher."
    Group.teacher.users.create(account: 'Teacher', password: 'pw', password_confirmation: 'pw')

    puts "Create a student"
    Group.student.users.create(account: 'Student', password: 'pw', password_confirmation: 'pw')

	end
end