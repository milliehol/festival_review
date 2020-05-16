class Festival < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :users, :through => :reviews
  belongs_to :user
  belongs_to :city
end
