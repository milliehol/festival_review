class Festival < ApplicationRecord
  has_many :reviews
  has_many :users, :through => :reviews
  belongs_to :user
  belongs_to :city
  accepts_nested_attributes_for :city
end
