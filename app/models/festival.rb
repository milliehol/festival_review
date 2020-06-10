class Festival < ApplicationRecord
  has_many :reviews
  has_many :users, :through => :reviews
  belongs_to :user
  belongs_to :city
  accepts_nested_attributes_for :city
  validates :name, presence: true
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}
  scope :longest, -> { order('length(name) desc')}


  def self.alpha
    order(:city)
  end

<<<<<<< HEAD

=======
  #allows for nested form
>>>>>>> f82d0bd163923c0ca309b86864f3d8cc171af129
  def city_attributes=(attributes)
    self.city = City.find_or_create_by(attributes) if !attributes['name'].empty?
    self.city
  end

  def name_and_city
    "#{name} - #{city_and_state}"
  end

  def city_and_state
    "#{city.try(:name)}, #{city.try(:state)}"
  end
end
