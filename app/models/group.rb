# encoding: utf-8
class Group < ActiveRecord::Base

	has_many :memberships
	has_many :users, through: :memberships, dependent: :destroy

	validates :title, presence: true, uniqueness: true
end
