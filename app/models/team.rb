class Team < ActiveRecord::Base

  has_many :user_teams, :dependent => :destroy
  has_many :users, through: :user_teams

  accepts_nested_attributes_for :user_teams, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates :name, presence: true, uniqueness: true

  validates :game, presence: true, inclusion: { in: %w(highlander 6v6 unspecified) }


  scope :accepted_by, -> (u){ joins(:user_teams).where('user_teams.accepted=?', 'true').where('user_teams.user_id=?', 'u.id') }
  scope :captained_by, -> (u){ where(:captain => u.id).joins(:user_teams).where('user_teams.user_id=?', 'u.id') }
  scope :pending_action_from, -> (u){ joins(:user_teams).where('user_teams.accepted=?', 'false').where('user_teams.user_id=?', 'u.id') }

end
