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
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length: { minimum: 6, maximum: 30 }, on: :update
  validates :user_name, :email, uniqueness: true
  validates :user_name, :password, presence: true
  mount_uploader :avatar, ImageUploader
  enum role: %w[member mod admin]
  validates :avatar, file_size: { less_than: 5.megabytes }
  validates :uid, uniqueness: { scope: :provider }, on: :update
  validates :email, presence: true, if: proc { provider == 'email' }
  enum gender: %w[male female gay less other]
  has_secure_password
  has_many :carts
  has_one :cart
  has_many :orders, through: :carts
  has_many :comments

  # Activates an account.
  def activate
    # update_attribute(:activated, true)
    # update_attribute(:activated_at, Time.zone.now)
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    update_attribute(:activation_sent_at, Time.zone.now) if UserMailer.account_activation(self).deliver_now
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    # update_attribute(:reset_digest,  User.digest(reset_token))
    # update_attribute(:reset_sent_at, Time.zone.now)
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # NewToken
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def activation_request_expired?
    activation_sent_at < 1.minutes.ago
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
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
end
