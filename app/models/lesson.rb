# encoding: utf-8
class Lesson < ActiveRecord::Base

	has_many :arragements
	has_many :users, through: :arragements, dependent: :destroy

end