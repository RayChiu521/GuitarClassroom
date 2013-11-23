# encoding: utf-8
class Arrangement < ActiveRecord::Base

	belongs_to :user
	belongs_to :lesson

end