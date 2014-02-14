class Server < ActiveRecord::Base

  #has_many :users
  has_many :reviews

  VALID_SERVER_ADDRESS = /\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,5}\z/
  validates :address, presence: true, format: { with: VALID_SERVER_ADDRESS }, uniqueness: true
  # TODO: add server address indexes for uniqueness

  validates :map, length: { minimum: 4 }

  # TODO: add region support

  validates :password, length: { minimum: 8 }, presence: true, if: :is_dedicated?
  validates :game, inclusion: { in: %w(highlander 6v6 unspecified) }, presence: true, if: :is_dedicated?

  validates :flags, numericality: { greater_than_or_equal_to: 0 }
  validates :players, numericality: { greater_than_or_equal_to: 0 }
  validates :maxplayers, numericality: { greater_than_or_equal_to: 1 }, presence: true, if: not :is_dedicated?
  validates :tags, length: { maximum: 30 }

  def is_dedicated?
    :dedicated
  end

end
