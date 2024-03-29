class Team < ActiveRecord::Base

  has_many :users_teams, :dependent => :destroy
  has_many :users, through: :users_teams

  belongs_to :tf2_server

  accepts_nested_attributes_for :users_teams, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates :name, presence: true, uniqueness: true

  validates :game, presence: true, inclusion: { in: %w(highlander 6v6 unspecified) }


  scope :has_member, -> (u){ where('captain!=?', u.id).joins(:users_teams).where('users_teams.accepted=?', true).where('users_teams.user_id=?', u.id).uniq }
  #scope :has_captain, -> (u){ where(:captain => u.id).joins(:users_teams).where('users_teams.user_id=?', u.id).uniq }
  scope :has_captain, -> (u){ where(:captain => u.id).uniq }
  scope :has_invited, -> (u){ joins(:users_teams).where('users_teams.accepted=?', false).where('users_teams.user_id=?', u.id).uniq }

  def is_temporary?
    temporary
  end

  def is_not_temporary?
    not is_temporary?
  end

end
