class City < ApplicationRecord
  has_many :festivals

  validates :name, presence: true


  def city_and_state
    "#{name}, #{state}"
  end
end
