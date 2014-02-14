class Review < ActiveRecord::Base

  belongs_to :server
  #belongs_to :user

  validates :rating_administration, numericality: { greater_than: 0, less_than: 11 }
  validates :rating_reliability,    numericality: { greater_than: 0, less_than: 11 }
  validates :rating_speed,          numericality: { greater_than: 0, less_than: 11 }
  validates :rating_other,          numericality: { greater_than: 0, less_than: 11 }

  validates :title, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 200 }

end
