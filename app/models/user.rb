class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
   message: "is not an email" }
  validates :password, :presence => true, :confirmation => true, :length => {minimum: 6}, :on => :create
end