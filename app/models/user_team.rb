class UserTeam < ActiveRecord::Base

  #belongs_to :user
  belongs_to :team

  validates :role, presence: true, inclusion: { in: %w(scout soldier pyro demo heavy engineer medic sniper spy) }

  # TODO: add validation of roles

end
