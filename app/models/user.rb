# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: {minimum: 8}, if: -> { new_record? || !password.nil? }
  validates :name, presence: true, length: {minimum: 3}
  enum :role, [:user, :admin]
  before_validation :normalize_email
  after_create :save_username
  has_many :actors
  has_many :comments, dependent: :destroy

  def normalize_email
    self.email.downcase!
    self.email.strip!
  end

  def save_username
    self.update_column(:username, self.email.split('@')[0])
  end
end
