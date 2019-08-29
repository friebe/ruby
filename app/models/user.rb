class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :nullify
  validates_uniqueness_of :username

  validates :username, presence: true, allow_blank: false
end