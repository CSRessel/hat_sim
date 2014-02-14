class Team < ActiveRecord::Base

  has_many :user_teams
  #has_many :users, through: :user_teams

  validates :game, presence: true, inclusion: { in: %w(highlander 6v6 unspecified) }

  validates :name, presence: true, uniqueness: true
  # TODO: add team name indexes for uniqueness

end
