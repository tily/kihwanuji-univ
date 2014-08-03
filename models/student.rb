class Student
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPE = %w(bachelor master doctor)

  field :type, type: String

  validates :type, allow_nil: true, inclusion: {in: TYPE}

  has_and_belongs_to_many :lectures
  has_one :account
  has_many :papers
  belongs_to :course
  belongs_to :teacher
end
