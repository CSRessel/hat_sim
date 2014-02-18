class Chain < ActiveRecord::Base

  belongs_to :subforum
  belongs_to :user

  has_many :posts

  validates :title, presence: true, length: { maximum: 25 }
  validates :body, presence: true, length: { maximum: 1000 }

end
