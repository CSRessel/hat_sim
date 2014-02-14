class Subforum < ActiveRecord::Base

  has_many :chains

  validates :name, presence: true, length: { maximum: 40 }

end
