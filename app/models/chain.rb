class Chain < ActiveRecord::Base

  belongs_to :subforum
  #belongs_to :user

  has_many :posts

  validates :title, presence: true, length: { minimum: 5, maximum: 25 }

end
