class User < ApplicationRecord
  # has_secure_password
  attr_accessor :password
  validates :username, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
   message: "is not an email" }
  validates :password, :presence => true, :confirmation => true, length: { in: 6..10 }, :on => :create
end