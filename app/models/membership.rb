# encoding: utf-8
class Membership < ActiveRecord::Base

	belongs_to :user
	belongs_to :group

  validates :user_id, uniqueness: { scope: [:group_id] }

end
