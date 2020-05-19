class Festival < ApplicationRecord
  has_many :reviews
  has_many :users, :through => :reviews
  belongs_to :user
  belongs_to :city
  accepts_nested_attributes_for :city
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}

  validates :name, presence: true

  def self.alpha
    order(:city)
  end

  def name_and_city
    "#{name} - #{city.try(:name)}"
  end
end
