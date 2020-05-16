class City < ApplicationRecord
  has_secure_password
  has_many :festivals
end
