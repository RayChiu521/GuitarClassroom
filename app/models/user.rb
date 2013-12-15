# encoding: utf-8
class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation, :current_user

	has_many :memberships
	has_many :groups, through: :memberships, dependent: :destroy
	has_one :user_password, dependent: :destroy

  has_many :arrangements
  has_many :lessons, through: :arrangements, dependent: :destroy

  has_many :teachings, class_name: 'Lesson', foreign_key: 'teacher_id'

  has_many :songs

	validates :account, presence: true, uniqueness: true
	validates :password, confirmation: true, presence: { on: :create }
	validates :password_confirmation, presence: { on: :create }
  validates :nickname, presence: true

	before_save :encrypt_password
	after_create :default_membership
  before_destroy :is_teacher_or_admin

	def encrypt_password
    if password.present?
    	self.user_password = UserPassword.new
    	self.user_password.generate_password(password)
    end
  end

  def default_membership
  	self.groups << Group.default_group if self.groups.blank?
  end

  def is_admin?
    !self.in?(Group.admin.users).blank?
  end

  def is_teacher?
    !self.in?(Group.teacher.users).blank?
  end

  def group_titles
    self.groups.map { |group| group.title }
  end

  def join_group!(group)
    errors.add(:groups, "You have joined the [#{group.title}] group before!") and return if is_member_of?(group)
    self.groups << group
  end

  def quit_group!(group)
    self.groups.delete(group)
  end

  def is_member_of?(group)
    self.groups.include?(group)
  end

  def is_teacher_or_admin
    errors.add(:current_user, "You can't do that.") and return false if current_user.blank?
    errors.add(:current_user, "You can't do that.") and return false if !current_user.is_teacher? && !current_user.is_admin?
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
