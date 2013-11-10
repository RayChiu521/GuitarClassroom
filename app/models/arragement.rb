# encoding: utf-8
class Arragement < ActiveRecord::Base

	belongs_to :user
	belongs_to :lesson

end