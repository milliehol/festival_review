class User < ApplicationRecord
	has_secure_password
  has_many :reviews
  has_many :reviewed_festivals, :through => :reviews, source: :festival
  has_many :festivals
  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end
end
