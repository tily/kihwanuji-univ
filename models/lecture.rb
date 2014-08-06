class Lecture
  include Mongoid::Document
  include Mongoid::Timestamps

  DAY_IN_WEEK = %w(mon tue wed thu fri sat sun)
  PERIOD = 1..14
  CREDIT = 1..4
  SEMESTER = %w(first second)
  PERIOD_TO_TIME = {
    1 => '09:00-10:30',
    2 => '10:40-12:10',
    3 => '13:10-14:40',
    4 => '14:50-16:20',
    5 => '16:30-18:00',
    6 => '18:10-19:40',
    7 => '19:50-21:20',
    8 => '21:30-23:00',
    9 => '23:10-00:40',
    10 => '00:50-02:20',
    11 => '02:30-04:00',
    12 => '04:10-05:40',
    13 => '05:50-07:20',
    14 => '07:30-09:00'
  }

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
