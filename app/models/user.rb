class User < ApplicationRecord
  validates :name, presence: true, length:{ maximum: 15}

  VALID_MAILADDRESS_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true , format: {with: VALID_MAILADDRESS_REGEX}

  VALID_PASSWORD_REGEX = /\A(?=.*\d+.*)(?=.*[a-zA-Z]+.*).*\z/
  validates :password, length: {in: 8..32}, format: {with: VALID_PASSWORD_REGEX}
  validates :password_confirmation, confirmation: true
  has_secure_password

  has_many :articles
end
