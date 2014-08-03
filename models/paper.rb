class Paper
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :abstract, type: String
  field :introduction, type: String
  field :method, type: String
  field :theory, type: String
  field :results, type: String
  field :discussion, type: String
  field :conclusion, type: String
  field :acknowlegements, type: String
  field :references, type: String
  field :appendices, type: String

  validates :title, length: {maximum: 35}
  validates :abstract, length: {maximum: 140}
  [
    :introduction,
    :method,
    :theory,
    :results,
    :discussion,
    :conclusion,
    :acknowlegements,
    :references,
    :appendices
  ].each do |x|
    validates x, length: {maximum: 1000}
  end

  belongs_to :student
  belongs_to :teacher
end
