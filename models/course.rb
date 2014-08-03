class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPE = %w(bachelor graduate)

  field :name, type: String
  field :description, type: String
  field :type, type: String

  validates :name, length: {maximum: 35}
  validates :description, allow_nil: true, length: {maximum: 140}
  validates :type, inclusion: {in: TYPE}

  has_many :lectures
  has_many :students
  has_many :teachers
end
