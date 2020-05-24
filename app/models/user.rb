class User < ApplicationRecord
	has_secure_password
  has_many :reviews
  has_many :reviewed_festivals, :through => :reviews, source: :festival
  has_many :festivals
  validates :email, uniqueness: true, presence: true


  def self.create_by_github_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.name = auth_hash["info"]["name"]
      user.username = auth_hash["info"]["nickname"]
      user.uid = auth_hash["uid"]
      user.password = SecureRandom.hex
    end
  end

end
