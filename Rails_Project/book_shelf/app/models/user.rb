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
# nothing
class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates	:name,	presence:	true, length: { minimum: 6,maximum: 30 }, on: :update
  validates :user_name, :email, uniqueness: true
  validates :user_name, :password, presence: true
  mount_uploader :avatar, ImageUploader
  enum role: ['member','mod','admin']
  validates :avatar, file_size: { less_than: 5.megabytes }
  validates :uid,  uniqueness: { scope: :provider }	,on: :update
  validates :email, presence: true, :if => proc { provider == 'email' }
  enum gender: %w(male female gay less other)
  has_secure_password
  has_many :carts
  has_one :cart
  has_many :orders, through: :carts
  has_many :comments

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
