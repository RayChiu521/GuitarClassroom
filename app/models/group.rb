# encoding: utf-8
class Group < ActiveRecord::Base

	has_many :memberships
	has_many :users, through: :memberships, dependent: :destroy

	validates :title, presence: true, uniqueness: true

	def self.admin
		Group.find_by_title('Admin')
	end

	def self.teacher
		Group.find_by_title('Teacher')
	end

	def self.student
		Group.find_by_title('Student')
	end

	def self.visitor
		Group.find_by_title('Visitor')
	end

	def self.default_group
		Group.visitor
	end
end
