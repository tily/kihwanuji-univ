class Teacher
  include Mongoid::Document
  include Mongoid::Timestamps

  TYPE = %w(
    temporary_lecturer
    lecturer
    assistant_professor
    associate_professor
    affiliate_professor 
    professor
    emeritus
  )

  field :type, type: String
  field :url, type: String

  validates :type, inclusion: {in: TYPE}

  has_one :account
  has_many :lectures
  belongs_to :course
  has_many :papers
  has_many :students
end