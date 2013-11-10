# encoding: utf-8
class User < ActiveRecord::Base

	has_many :memberships
	has_many :groups, through: :memberships, dependent: :destroy
	has_one :user_password, dependent: :destroy

	validates :account, presence: true, uniqueness: true

end
