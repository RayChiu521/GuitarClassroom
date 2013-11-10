# encoding: utf-8
class UserPassword < ActiveRecord::Base

	belongs_to :user

	def generate_password(password)
    if password.present?
    	self.password_salt = BCrypt::Engine.generate_salt
    	self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end

  def authenticate_password(password)
  	self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt)
  end
end
