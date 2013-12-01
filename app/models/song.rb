# encoding: utf-8
class Song < ActiveRecord::Base

	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	belongs_to :songable, polymorphic: true

	validates :title, presence: true
end