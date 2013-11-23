# encoding: utf-8
class Lesson < ActiveRecord::Base

	has_many :arragements
	has_many :students, through: :arragements, source: :user, dependent: :destroy

	belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
end