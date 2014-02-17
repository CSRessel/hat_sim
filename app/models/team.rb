# Custom validation to ensure Team has correct roles filled
class RoleValidator < ActiveModel::Validator

  # TODO: get role validation for teams working
  def validate(record)
    unless record.game == 'unspecified'
      if true # check if user_teams have roles meeting requirements of :game
        record.errors[:roles] << 'Need requisite roles filled for specified game mode!'
      end
    end
  end

end

class Team < ActiveRecord::Base

  has_many :user_teams
  has_many :users, through: :user_teams

  include ActiveModel::Validations

  validates :name, presence: true, uniqueness: true

  validates :game, presence: true, inclusion: { in: %w(highlander 6v6 unspecified) }

  validates_with RoleValidator

end
