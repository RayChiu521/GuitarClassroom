# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Group.create!(title: 'Admin', is_admin: true) if Group.find_by_title('Admin').nil?
Group.create!(title: 'Teacher', is_admin: false) if Group.find_by_title('Teacher').nil?
Group.create!(title: 'Student', is_admin: false) if Group.find_by_title('Student').nil?
Group.create!(title: 'Visitor', is_admin: false) if Group.find_by_title('Visitor').nil?

if User.find_by_account('admin').nil?
	Group.find_by_title('Admin')
			 .users
			 .create(account: 'admin', nickname: 'Admin', password: 'admin', password_confirmation: 'admin')
end