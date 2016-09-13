class User < ActiveRecord::Base
  has_secure_password
  has_many :coders
  validates :email, presence: true
end
