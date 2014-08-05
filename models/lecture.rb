class Lecture
  include Mongoid::Document
  include Mongoid::Timestamps

  DAY_IN_WEEK = %w(mon tue wed thu fri sat sun)
  PERIOD = 1..12
  CREDIT = 1..4
  SEMESTER = %w(first second)

  field :title, type: String
  field :description, type: String
  field :day_in_week, type: String
  field :period, type: Integer
  field :credit, type: Integer
  field :year, type: String
  field :semester, type: String
  field :room, type: String

  validate :title, presence: true
  validate :description, presence: true
  validate :day_in_week, presence: true
  validate :period, presence: true

  validates :title, length: {maximum: 35}
  validates :description, length: {maximum: 140*5}

  validate :day_in_week, inclusion: {in: DAY_IN_WEEK}
  validate :period, inclusion: {in: PERIOD}
  validate :credit, inclusion: {in: CREDIT}
  validate :semester, inclusion: {in: %w(first second)}

  belongs_to :course
  belongs_to :teacher
  has_and_belongs_to_many :students
end
