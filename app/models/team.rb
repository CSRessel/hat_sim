class Team < ActiveRecord::Base

  has_many :user_teams
  has_many :users, through: :user_teams

  include ActiveModel::Validations

  validates :name, presence: true, uniqueness: true

  validates :game, presence: true, inclusion: { in: %w(highlander 6v6 unspecified) }

end
