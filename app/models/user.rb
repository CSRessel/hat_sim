class User < ActiveRecord::Base

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_one :stat

  belongs_to :server


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :class_scout,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_soldier,   numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_pyro,      numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_demo,      numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_heavy,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_engineer,  numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_medic,     numericality: { greater_than: 0, less_than: 10, only_integer: true }
  validates :class_sniper,    numericality: { greater_than: 0, less_than: 10, only_integer: true }

  validates :steam_link, presence: true, uniqueness: { case_sensitive: false }

  validates :region, inclusion: { in: %w(EST CST MST PST) }

end
