class User < ActiveRecord::Base

  has_many :users_teams, :dependent => :destroy
  has_many :teams, through: :users_teams

  has_many :reviews, :dependent => :destroy

  has_one :stat, :dependent => :destroy

  belongs_to :server


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :class_scout,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_soldier,   numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_pyro,      numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_demo,      numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_heavy,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_engineer,  numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_medic,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_sniper,    numericality: { greater_than: 0, less_than: 10, only_integer: true }

  validates :username, presence: true, uniqueness: true

  validates :steam_link, presence: true, uniqueness: { case_sensitive: false }

  validates :region, inclusion: { in: %w(EST CST MST PST) }


  scope :is_member_of, -> (t){ joins(:users_teams).where('users_teams.accepted=?', true).where('users_teams.team_id=?', t.id).uniq }
  scope :is_invited_to, -> (t){ joins(:users_teams).where('users_teams.accepted=?', false).where('users_teams.team_id=?', t.id).uniq }

end
