# encoding: utf-8
class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

	has_many :memberships
	has_many :groups, through: :memberships, dependent: :destroy
	has_one :user_password, dependent: :destroy

  has_many :arrangements
  has_many :lessons, through: :arrangements, dependent: :destroy

  has_many :teachings, class_name: 'Lesson', foreign_key: 'user_id'

	validates :account, presence: true, uniqueness: true
	validates :password, confirmation: true, presence: { on: :create }
	validates :password_confirmation, presence: { on: :create }

	before_save :encrypt_password
	after_create :default_membership

	def encrypt_password
    if password.present?
    	self.user_password = UserPassword.new
    	self.user_password.generate_password(password)
    end
  end

  def default_membership
  	self.groups << Group.default_group if self.groups.blank?
  end

  def is_teacher?
    !self.in?(Group.teacher.users).blank?
  end

  def self.authenticate(account, password)
    user = find_by_account(account)
    if user && user.user_password && user.user_password.authenticate_password(password)
      user
    else
      nil
    end
  end
end
