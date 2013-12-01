# encoding: utf-8
class Song < ActiveRecord::Base

	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

	validates :title, presence: true
end