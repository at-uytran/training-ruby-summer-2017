# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  birthday        :date
#  gender          :integer
#  password_digest :string(255)
#  user_name       :string(255)
#  avatar          :string(255)
#  provider        :string(255)
#  uid             :string(255)
#  role            :integer          default("member")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	# attr_accessor :remember_token
	# before_save { self.email = email.downcase }
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates	:name,	presence:	true, length: {minimum: 6,maximum: 30 }, on: :update

	# validates :user_name,	format:	{	with:	/\A[a-zA-Z]+\z/, message:	"only	allows	letters"	}

	# validates :password, :birthday, :email, :gender,:user_name, presence: true

	# validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	
	# validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  	# validates :name, presense: true, :on => :create
 	
 	validates :user_name, :email, uniqueness: true
 	validates :user_name, :password, presence: true
 	# validates :email, presence: true, :on => provider: 'email'
 	mount_uploader :avatar, ImageUploader
 	enum role: ['member','mod','admin']
 	# validates uniqueness: {:uid, :provider}
 	 	validates :avatar, file_size: {less_than: 5.megabytes}
 	validates :uid,  uniqueness: {scope: :provider}	
 	validates :email, presence: true, :if => Proc.new {provider == 'email'}
 	# validate :birthday
 	enum gender: %w(male female gay less other)
 	# def birthday
 	# 	self.errors.add(:birthday, 'must be over 16 years old') if birthday.present? && Time.now - 16.years < birthday
 	# end
 	# has_many :my_carts, class_name: 'Cart'
	has_secure_password
 	has_many :carts
 	has_one :cart
 	has_many :orders, through: :carts
 	has_many :comments
end
