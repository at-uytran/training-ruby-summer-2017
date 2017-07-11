class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates	:name,	presence:	true, length: {minimum: 5,maximum: 50 }
	validates :user_name,	format:	{	with:	/\A[a-zA-Z]+\z/, message:	"only	allows	letters"	}
	validates :password, :birthday, :email, :gender,:user_name, presence: true
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
 
end
