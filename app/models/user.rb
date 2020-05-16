class User < ApplicationRecord
	has_secure_password
  has_many :reviews
  has_many :reviewed_festivals, :through => :reviews, source: :festival
  has_many :festivals
  validates :username, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
